require 'rails_helper'

RSpec.describe 'Subscriptions' do 
  describe 'Post- new subscription' do 
    it 'subscribes a customer to a tea subscription' do 
      lucas = Customer.create!(first_name: "Lucas", last_name: "Kleeman", 
                          email: "lucas69@yahoo.com", address: "1401 Smooch Ln", 
                          password: "Password")
      tea = Tea.create!(title: "Loose Leaf Black", 
                    description: "Loose Leaf black tea", 
                    temperature: 90, brew_time: 4)
      subs = Subscription.create!(title: "Bronze", price: 25, frequency: 3)
      
      header = { CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json' }

      st_params = { subscription_id: subs.id, tea_id: tea.id }
      cs_params = { subscription_id: subs.id, customer_id: lucas.id }

      post '/api/v0/customer_subscriptions', headers: header, params: { customer_subscription: cs_params, subscription_tea: st_params }.to_json
    end
  end
end