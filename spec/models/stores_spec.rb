require 'rails_helper'

RSpec.describe Store, type: :model do
  it 'emailの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: nil,
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'emailの値が"aaa@bbb.cccの形式でない場合バリデーションが通らない' do
    store = Store.new(
      email: 'aaa',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'passwordの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: nil,
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'passwordの値が6文字未満ならバリデーションが通らない' do
    store = Store.new(
      email: 'test@example.com',
      password: "abcde",
      password_confirmation: "abcde",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'passwordとpassword_confirmationの値が一致しないならば、バリデーションが通らない' do
    store = Store.new(
      email: 'test@example.com',
      password: "hogehoge",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'nameの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: nil,
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'nameの値が30文字以上ならバリデーションが通らない' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "a" * 31,
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'addressの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: nil,
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'telephoneの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: nil,
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'start_timeの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: nil,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'end_timeの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: nil,
      access: "atti",
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'accessの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: nil,
      image: "image",
    )
    expect(store).not_to be_valid
  end

  it 'imageの値がnilならNotnull制約違反になる' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: nil,
    )
    expect(store).not_to be_valid
  end

  it '正しく入力されている場合バリデーションが通る' do
    store = Store.new(
      email: 'test@example.com',
      password: "password",
      password_confirmation: "password",
      name: "ebisu",
      address: "渋谷区",
      telephone: "090-9999-1111",
      start_time: Time.now,
      end_time: Time.now,
      access: "atti",
      image: "image",
    )
    expect(store).to be_valid
  end
end