require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:rental_number) }
    it { should validate_presence_of(:rental_date) }
    it { should validate_presence_of(:date_return) }
    it { should validate_presence_of(:destination) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:car) }
  end
end
