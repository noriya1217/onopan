FactoryBot.define do
  factory :product_image do
    product_id { Product.first.id }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/profile_image.jpg'), 'image/jpeg') }
  end
end
