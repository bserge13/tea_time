class CustomerSubscriptionSerializer 
  include JSONAPI::Serializer 
  attributes :subscription_id, :customer_id 
  belongs_to :subscription
  belongs_to :customer
end
