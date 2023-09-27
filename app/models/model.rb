class Model < ApplicationRecord
  has_many :cars

  validates :name, presence: true, uniqueness: true
  validates :year, presence: true
  validates :manufacturer, presence: true
  validates :image, presence: true
  validates :image, format: { with: /\.(png|jpg|jpeg)\Z/i, message: "must be a URL for GIF, JPG or PNG image." }
end
