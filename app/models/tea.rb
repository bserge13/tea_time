class Tea < ApplicationRecord
  validates :title, :description, :temperature, :brew_time, presence: true
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
end
