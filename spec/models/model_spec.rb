require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'Association' do
    it { should have_many(:cars) }
  end
end
