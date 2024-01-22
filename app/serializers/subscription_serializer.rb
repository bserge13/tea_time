class SubscriptionSerializer  
  include JSONAPI::Serializer 
  attributes :title, :price, :status, :frequency
  has_many :teas 
  has_many :customer_subscriptions

  attribute :tea_count do |object| 
    object.teas.count 
  end
end