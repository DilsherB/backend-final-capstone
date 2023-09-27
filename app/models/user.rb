class User < ApplicationRecord
  has_many :cars
  has_many :rentals

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :id, presence: true, uniqueness: true
  validates :phone_number, presence: true
end
