class Subscription < ApplicationRecord
  validates :title, :price, :status, :frequency, presence: true 
  enum status: %w(inactive active)
end
