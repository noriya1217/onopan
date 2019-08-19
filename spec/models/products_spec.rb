require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    FactoryBot.create(:store)
  end

  it 'store_idの値がnilならNotnull制約違反になる' do
    product = Product.new(
      store_id: nil,
      name: '食パン10斤セット',
      number: 10,
      price: 1024,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'nameの値がnilならNotnull制約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: nil,
      number: 10,
      price: 1024,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'nameの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '',
      number: 10,
      price: 1024,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'numberの値がnilならNotNull成約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: nil,
      price: 1024,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'numberの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: '',
      price: 1024,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'priceの値がnilならNotNull成約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: nil,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'priceの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: '',
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'contentの値がnilならNotNull成約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: nil,
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'contentの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'preservationの値がnilならNotNull成約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: nil,
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'preservationの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'how_to_eatの値がnilならNotNull成約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: nil,
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'how_to_eatの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'expirationの値がnilならNotNull成約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍後トースターなどで食べるとヨシ',
      expiration: nil,
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'expirationの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍後トースターなどで食べるとヨシ',
      expiration: '',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'shippingの値がnilならNotNull成約違反になる' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍後トースターなどで食べるとヨシ',
      expiration: '2020/02/20',
      shipping: nil,
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it 'shippingの値が未入力ならバリデーションが通らない' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 5,
      price: 256,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍後トースターなどで食べるとヨシ',
      expiration: '2020/02/20',
      shipping: '',
      remarks: '備考',
    )
    expect(product).not_to be_valid
  end

  it '正しく入力されている場合バリデーションが通る' do
    product = Product.new(
      store_id: Store.first.id,
      name: '食パン10斤セット',
      number: 10,
      price: 1024,
      content: '小麦、そば粉、米粉等いろいろな材料で作られた食パンのセット',
      preservation: '冷凍保存',
      how_to_eat: '自然解凍してから普通の食パンと同じ食べ方でOK',
      expiration: '2019/08/30',
      shipping: 'クロネコヤマト',
      remarks: '備考',
    )
    expect(product).to be_valid
  end
end