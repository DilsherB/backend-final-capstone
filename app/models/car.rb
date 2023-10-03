class Car < ApplicationRecord
  belongs_to :user
  belongs_to :model
  has_many :rentals, foreign_key: 'car_id'

  validates :plate_number, presence: true, uniqueness: true
  validates :image, :price, :name, presence: true
  validates :image, format: { with: /\.(png|jpg|jpeg)\Z/i, message: 'must be a URL for GIF, JPG or PNG image.' }
  validates_associated :model
end
