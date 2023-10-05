class Car < ApplicationRecord
  belongs_to :user
  belongs_to :model
  has_many :rentals, foreign_key: 'car_id'
  has_one_attached :image

  validates :plate_number, presence: true, uniqueness: true
  validates :image, :price, :name, presence: true
  validates :image, format: { with: /\.(png|jpg|jpeg)\Z/i, message: 'must be a URL for GIF, JPG or PNG image.' }
  validates_associated :model

  def available_cars
    Car.find_by(status: true)
  end

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
