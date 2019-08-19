require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  before do
    FactoryBot.create(:store)
    FactoryBot.create(:product)
  end

  it 'product_idの値がnilならNotnull制約違反になる' do
    product_image = ProductImage.new(
      product_id: nil,
      image: Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/profile_image.jpg'), 'image/jpeg'),
    )
    expect(product_image).not_to be_valid
  end

  it 'imageの値がnilならNotnull制約違反になる' do
    product_image = ProductImage.new(
      product_id: Product.first.id,
      image: nil,
    )
    expect(product_image).not_to be_valid
  end

  it 'imageの値が未入力ならバリデーションが通らない' do
    product_image = ProductImage.new(
      product_id: Product.first.id,
      image: "",
    )
    expect(product_image).not_to be_valid
  end

  it '正しく入力されている場合バリデーションが通る' do
    product_image = ProductImage.new(
      product_id: Product.first.id,
      image: Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/profile_image.jpg'), 'image/jpeg'),
    )
    expect(product_image).to be_valid
  end
end