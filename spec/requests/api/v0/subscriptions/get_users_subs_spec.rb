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
      expect(response).to be_successful
      expect(response.status).to eq 200 

      subs = JSON.parse(response.body, symbolize_names: true)

      expect(subs[:data][0]).to be_a Hash 
      expect(subs[:data][0]).to have_key :type 
      expect(subs[:data][0][:type]).to eq "subscription"
      expect(subs[:data][0][:attributes]).to have_key :title
      expect(subs[:data][0][:attributes][:title]).to be_a String 
      expect(subs[:data][0][:attributes]).to have_key :price
      expect(subs[:data][0][:attributes][:price]).to be_an Integer
      expect(subs[:data][0][:attributes]).to have_key :status
      expect(subs[:data][0][:attributes][:status]).to be_a String
      expect(subs[:data][0][:attributes][:status]).to eq "active"
      expect(subs[:data][0][:attributes]).to have_key :frequency
      expect(subs[:data][0][:attributes][:frequency]).to be_an Integer
      expect(subs[:data][0][:attributes]).to have_key :tea_count
      expect(subs[:data][0][:attributes][:tea_count]).to be_an Integer 
      expect(subs[:data][0][:attributes][:tea_count]).to eq 2 

      expect(subs[:data][1][:attributes][:status]).to eq "cancelled"
      expect(subs[:data][1][:attributes][:tea_count]).to eq 0 
    end

    it 'sad path- requires a valid customer to cancel a subscription' do 
      header = { CONTENT_TYPE: 'application/json',
      ACCEPT: 'application/json' }

      get "/api/v0/customer_subscriptions/00/subscriptions", headers: header
      expect(response).to_not be_successful
      expect(response.status).to eq 404 

      error = JSON.parse(response.body, symbolize_names: true)
      expect{Customer.find(00)}.to raise_error(ActiveRecord::RecordNotFound)
      expect(error[:exception]).to eq("#<ActiveRecord::RecordNotFound: Couldn't find Customer with 'id'=00>")
    end 
  end 
end 
