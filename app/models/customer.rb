class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, :address, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

  validates_presence_of :password_digest
  has_secure_password
end
