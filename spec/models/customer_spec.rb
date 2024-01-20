require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end

  describe 'relationships' do 
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:subscriptions).through (:customer_subscriptions) }
  end 
end
