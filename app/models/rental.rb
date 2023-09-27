class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :rental_number, presence: true, uniqueness: true
  validates :rental_date, presence: true
  validates :time_depart, presence: true
  validates :time_arrive, presence: true
  validates :date_return, presence: true
  validates :payment, presence: true
end
