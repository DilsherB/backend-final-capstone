require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:plate_number) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:name) }

    it 'validates associated model' do
      should belong_to(:model)
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:model) }
    it { should have_many(:rentals).with_foreign_key('car_id') }
    it { should have_one_attached(:image) }
  end
end
