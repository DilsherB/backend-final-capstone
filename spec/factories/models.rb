FactoryBot.define do
  factory :model do
    name { Faker::Name.name }
    year { Faker::Number.binary(digits: 4) }
    manufacturer { Faker::Name.name }
    logo { 'logo.jpg' }
  end
end
