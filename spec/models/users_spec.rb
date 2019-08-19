require 'rails_helper'

RSpec.describe User, type: :model do
  it 'nameの値がnilならNotnull制約違反になる' do
    user = User.new(
      name: nil,
      age: 30,
      sex: '男',
      profession: '社会人',
      email: 'test@example.com',
      address: '渋谷区',
      line_id: 'test' * 4,
    )
    expect(user).not_to be_valid
  end

  it 'ageの値が130を超過しているならバリデーションが通らない' do
    user = User.new(
      name: 'test',
      age: 131,
      sex: '男',
      profession: '社会人',
      email: 'test@example.com',
      address: '渋谷区',
      line_id: 'test' * 4,
    )
    expect(user).not_to be_valid
  end

  it '性別の値が男女以外ならバリデーションが通らない' do
    user = User.new(
      name: 'test',
      age: 30,
      sex: '不明',
      profession: '社会人',
      email: 'test@example.com',
      address: '渋谷区',
      line_id: 'test' * 4,
    )
    expect(user).not_to be_valid
  end

  it "emailの値が'aaa@bbb.ccc'の形式以外ならバリデーションが通らない" do
    user = User.new(
      name: 'test',
      age: 30,
      sex: '男',
      profession: '社会人',
      email: 'test',
      address: '渋谷区',
      line_id: 'test' * 4,
    )
    expect(user).not_to be_valid
  end

  it "addressの値がnilならNotNull制約違反になる" do
    user = User.new(
      name: 'test',
      age: 30,
      sex: '男',
      profession: '社会人',
      email: 'test@example.com',
      address: nil,
      line_id: 'test' * 4,
    )
    expect(user).not_to be_valid
  end

  it "line_idの値がnilならNotNull制約違反になる" do
    user = User.new(
      name: 'test',
      age: 30,
      sex: '男',
      profession: '社会人',
      email: 'test@example.com',
      address: '渋谷区',
      line_id: nil,
    )
    # expect(user.save).to be_falsey
    expect { user.save }.to raise_error(ActiveRecord::NotNullViolation)
  end

  it '正しく入力されている場合バリデーションが通る' do
    user = User.new(
      name: 'test',
      age: 30,
      sex: '男',
      profession: '社会人',
      email: 'test@example.com',
      address: '渋谷区',
      line_id: 'test' * 4,
    )
    expect(user).to be_valid
  end
end