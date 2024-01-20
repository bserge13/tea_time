require "rails_helper"

RSpec.describe CustomerSubscriptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/customer_subscriptions").to route_to("customer_subscriptions#index")
    end

    it "routes to #show" do
      expect(get: "/customer_subscriptions/1").to route_to("customer_subscriptions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/customer_subscriptions").to route_to("customer_subscriptions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/customer_subscriptions/1").to route_to("customer_subscriptions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/customer_subscriptions/1").to route_to("customer_subscriptions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/customer_subscriptions/1").to route_to("customer_subscriptions#destroy", id: "1")
    end
  end
end
