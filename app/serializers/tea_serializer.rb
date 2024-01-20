class TeaSerializer 
  include JSONAPI::Serializer 
  attributes :title, :description, :temperature, :brew_time
  belongs_to :subscription
end