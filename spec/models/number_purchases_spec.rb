require 'rails_helper'

RSpec.describe NumberPurchase, type: :model do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:store)
    FactoryBot.create(:product)
    FactoryBot.create(:product_image)
  end

  it 'user_idの値がnilならNotnull制約違反になる' do
    number_purchase = NumberPurchase.new(
      user_id: nil,
      product_id: Product.first.id,
    )
    expect(number_purchase).not_to be_valid
  end

  it 'product_idの値がnilならNotnull制約違反になる' do
    number_purchase = NumberPurchase.new(
      user_id: User.first.id,
      product_id: nil,
    )
    expect(number_purchase).not_to be_valid
  end

  it '正しく入力されている場合バリデーションが通る' do
    number_purchase = NumberPurchase.new(
      user_id: User.first.id,
      product_id: Product.first.id,
    )
    expect(number_purchase).to be_valid
  end
end