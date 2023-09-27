class Car < ApplicationRecord
  belongs_to :user
  belongs_to :model
  has_many :rentals

  validates :license_plate, presence: true, uniqueness: true
  validates :status, presence: true
  validates :model_id, presence: true
end
