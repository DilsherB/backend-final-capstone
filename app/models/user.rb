class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cars, foreign_key: 'user_id'
  has_many :rentals, foreign_key: 'user_id'

  validates :name, :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :id, presence: true, uniqueness: true
end
