class SubscriptionSerializer  
  include JSONAPI::Serializer 
  attributes :title, :price, :status, :frequency
  has_many :teas 

  attribute :tea_count do |object| 
    object.teas.count 
  end
end