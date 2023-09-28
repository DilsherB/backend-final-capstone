class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :rental_number, presence: true, uniqueness: true
  validates :rental_date, :time_depart, :time_arrive, :date_return, :payment, presence: true
end
