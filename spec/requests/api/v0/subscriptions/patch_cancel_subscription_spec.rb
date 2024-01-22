require 'rails_helper'

RSpec.describe 'Subscriptions' do 
  describe 'Patch- cancel subscription' do 
    before :each do 
      @lucas = Customer.create!(first_name: "Lucas", last_name: "Kleeman", 
                          email: "lucas69@yahoo.com", address: "1401 Smooch Ln", 
                          password: "Password")
      @subs = Subscription.create!(title: "Bronze", price: 25, frequency: 3, status: 1)
      @tea_1 = @subs.teas.create!(title: "Loose Leaf- Black", 
                    description: "Loose Leaf black tea", 
                    temperature: 90, brew_time: 4)
      @tea_2 = @subs.teas.create!(title: "Loose Leaf- Green", 
                    description: "Loose Leaf green tea", 
                    temperature: 90, brew_time: 4)
      @active_sub = CustomerSubscription.create!(subscription_id: @subs.id, customer_id: @lucas.id)
    end
    
    it 'happy path- cancels a customers tea subscription' do 
      header = { CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json' }

      cancel_params = { password: @lucas.password, email: @lucas.email }

      patch "/api/v0/customer_subscriptions/cancel_subscription/#{@active_sub.id}", headers: header, params: JSON.generate(cancel_params)
      expect(response).to be_successful
      expect(response.status).to eq 200 

      contract = CustomerSubscription.last 
      expect(contract.customer).to eq @lucas
      expect(contract.subscription).to eq @subs 
      expect(@subs.reload.status).to eq("cancelled")
    end

    it 'sad path- renders an error for wrong credentials' do 
      header = { CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json' }

      cancel_params = { password: "assword", email: @lucas.email }

      patch "/api/v0/customer_subscriptions/cancel_subscription/#{@active_sub.id}", headers: header, params: JSON.generate(cancel_params)

      expect(response).to_not be_successful
      expect(response.status).to eq 401

      contract = CustomerSubscription.last 
      expect(contract.customer).to eq @lucas
      expect(contract.subscription).to eq @subs 
      expect(@subs.reload.status).to eq("active")
    end
  end
end
