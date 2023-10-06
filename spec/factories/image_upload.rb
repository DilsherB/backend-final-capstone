FactoryBot.define do
  factory :image_upload do
    image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg'), 'image/jpg') }
  end
end
