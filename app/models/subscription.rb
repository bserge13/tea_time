class Subscription < ApplicationRecord
  validates :title, :price, :status, :frequency, presence: true 
  enum status: %w(inactive active cancelled) 
  
  has_many :teas, dependent: :destroy 
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
end
