require 'rails_helper'

RSpec.describe 'Subscriptions' do 
  describe 'Get- all user subscriptions' do 
    it 'happy path- cancels a customers tea subscription' do 
      lucas = Customer.create!(first_name: "Lucas", last_name: "Kleeman", 
                          email: "lucas69@yahoo.com", address: "1401 Smooch Ln", 
                          password: "Password")
      sub_1 = Subscription.create!(title: "Bronze", price: 25, frequency: 3, status: 1)
      sub_2 = Subscription.create!(title: "Bronze", price: 25, frequency: 3, status: 2)
      tea_1 = sub_1.teas.create!(title: "Loose Leaf- Black", 
                    description: "Loose Leaf black tea", 
                    temperature: 90, brew_time: 4)
      tea_2 = sub_1.teas.create!(title: "Loose Leaf- Green", 
                    description: "Loose Leaf green tea", 
                    temperature: 90, brew_time: 4)
      active_sub_1 = CustomerSubscription.create!(subscription_id: sub_1.id, customer_id: lucas.id)
      active_sub_2 = CustomerSubscription.create!(subscription_id: sub_2.id, customer_id: lucas.id)
    
      header = { CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json' }

      get "/api/v0/customer_subscriptions/#{lucas.id}/subscriptions", headers: header
      require 'pry'; binding.pry
      expect(response).to be_successful
      expect(response.status).to eq 200 

    end
  end 
end 
