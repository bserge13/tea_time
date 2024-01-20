require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:frequency) }
  end 

  describe 'enum' do
    it { should define_enum_for(:status).with_values(inactive: 0, active: 1) }
  end
end
