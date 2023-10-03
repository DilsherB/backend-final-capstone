require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'Association' do
    it { should belong_to(:user) }
  end
end
