require 'rails_helper'

RSpec.describe 'Stores', type: :system do
  before do
    FactoryBot.create(:store)
  end

  describe 'ログイン' do
    it 'ログイン失敗' do
      visit root_url
      fill_in 'store_email', with: 'example@yahoo.co.jp'
      fill_in 'store_password', with: 'abcdefg'
      click_button 'Log in'
      expect(page).to have_content 'メールアドレス もしくはパスワードが不正です。'
    end

    it 'ログイン成功成功' do
      visit root_url
      fill_in 'store_email', with: 'test@nifty.com'
      fill_in 'store_password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content 'store_indexメニュー画面'
    end
  end

  describe 'サインアップ' do
    it 'サインアップ失敗' do
      visit new_store_registration_path
      click_button 'Sign up'
      expect(page).to have_content 'エラーが発生したため 店舗情報 は保存されませんでした'
    end

    it 'サインアップ成功' do
      visit new_store_registration_path
      fill_in 'store_name', with: 'にこにこパン屋さん'
      fill_in 'store_address', with: '東京都渋谷区'
      fill_in 'store_email', with: 'exsample@google.com'
      fill_in 'store_telephone', with: '03-1234-5678'
      fill_in 'store_access', with: '渋谷駅からあっちのほうに2km行って左へ6時間'
      fill_in 'store_password', with: 'password'
      fill_in 'store_password_confirmation', with: 'password'
      attach_file 'store_image', "#{Rails.root}/spec/factories/profile_image.jpg"
      click_button 'Sign up'
      expect(page).to have_content 'store_indexメニュー画面'
    end
  end
end