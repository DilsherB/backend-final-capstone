class Car < ApplicationRecord
  belongs_to :user
  belongs_to :model
  has_many :rentals, foreign_key: 'car_id'

  validates :license_plate, presence: true, uniqueness: true
  validates :status, :name, :image, :price, presence: true
end
