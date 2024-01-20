class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, :address, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  
  validates_confirmation_of :password
  has_secure_password
end
