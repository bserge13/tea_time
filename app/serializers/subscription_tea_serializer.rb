class SubscriptionTeaSerializer 
  include JSONAPI::Serializer 
  attributes :subscription_id, :tea_id 
  belongs_to :subscription, :tea
end
