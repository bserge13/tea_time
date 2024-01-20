class Subscription < ApplicationRecord
  validates :title, :price, :status, :frequency, presence: true 
  enum status: %w(inactive active)

  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
end
