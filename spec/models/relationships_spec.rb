require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:store)
  end

  it 'user_idの値がnilならNotnull制約違反になる' do
    relationship = Relationship.new(
      user_id: nil,
      store_id: Store.first.id,
    )
    expect(relationship).not_to be_valid
  end

  it 'store_idの値がnilならNotnull制約違反になる' do
    relationship = Relationship.new(
      user_id: User.first.id,
      store_id: nil,
    )
    expect(relationship).not_to be_valid
  end

  it '正しく入力されている場合バリデーションが通る' do
    relationship = Relationship.new(
      user_id: User.first.id,
      store_id: Store.first.id,
    )
    expect(relationship).to be_valid
  end

end