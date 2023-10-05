class CarSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :plate_number, :status, :image, :price, :city, :created_at, :updated_at, :image_url, :model_id
end
