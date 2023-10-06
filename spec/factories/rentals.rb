FactoryBot.define do
  factory :rental do
    rental_number { SecureRandom.uuid }
    rental_date { Date.today }
    date_return { Date.tomorrow }
    destination { 'Langoshtown' }
    user
    car
  end
end
