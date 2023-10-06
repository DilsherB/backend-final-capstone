FactoryBot.define do
  factory :car do
    name { 'Car Name' }
    plate_number { Faker::Number.binary(digits: 6) }
    status { true }
    price { 100.00 }
    city { 'City Name' }
    association :user, factory: :user
    association :model, factory: :model

    after(:build) do |car|
      car.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg')),
        filename: 'test_image.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
