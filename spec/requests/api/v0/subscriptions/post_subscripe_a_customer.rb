require 'rails_helper'

RSpec.describe 'Subscriptions' do 
  describe 'Post- new subscription' do 
    before :each do 
      @lucas = Customer.create!(first_name: "Lucas", last_name: "Kleeman", 
                          email: "lucas69@yahoo.com", address: "1401 Smooch Ln", 
                          password: "Password")
      @subs = Subscription.create!(title: "Bronze", price: 25, frequency: 3)
      @tea_1 = @subs.teas.create!(title: "Loose Leaf- Black", 
                    description: "Loose Leaf black tea", 
                    temperature: 90, brew_time: 4)
      @tea_2 = @subs.teas.create!(title: "Loose Leaf- Green", 
                    description: "Loose Leaf green tea", 
                    temperature: 90, brew_time: 4)
    end
    it 'subscribes a customer to a tea subscription' do 
      header = { CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json' }

      custsub_params = { subscription_id: @subs.id, customer_id: @lucas.id }
      expect(CustomerSubscription.count).to eq 0

      post '/api/v0/customer_subscriptions', headers: header, params: JSON.generate(custsub_params)
      expect(response).to be_successful
      expect(response.status).to eq 201
      expect(CustomerSubscription.count).to eq 1

    end
  end
end