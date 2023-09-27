class User < ApplicationRecord
  has_many :cars, foreign_key: 'user_id'
  has_many :rentals, foreign_key: 'user_id'

  validates :name, :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :id, presence: true, uniqueness: true
end
