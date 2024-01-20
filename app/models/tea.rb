class Tea < ApplicationRecord
  validates :title, :description, :temperature, :brew_time, presence: true
  belongs_to :subscription
end
