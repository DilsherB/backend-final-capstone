class Model < ApplicationRecord
  has_many :cars

  validates :name, presence: true, uniqueness: { scope: %i[name year], message: 'ModelName and Year already exists' }
  validates :year, :manufacturer, :logo, presence: true
  validates :logo, format: { with: /\.(png|jpg|jpeg)\Z/i, message: 'must be a URL for GIF, JPG or PNG image.' }
end
