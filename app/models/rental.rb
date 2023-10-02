class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :rental_number, presence: true, uniqueness: true
  validates :rental_date, :date_return, :destination, presence: true
end
