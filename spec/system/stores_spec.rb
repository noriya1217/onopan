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

  describe 'プロフィール編集' do
    it '編集失敗' do
      visit root_url
      fill_in 'store_email', with: 'test@nifty.com'
      fill_in 'store_password', with: 'password'
      click_button 'Log in'
      visit store_path(Store.first.id)
      click_on '編集'
      fill_in 'store_name', with: ''
      fill_in 'store_address', with: ''
      fill_in 'store_email', with: ''
      fill_in 'store_telephone', with: ''
      fill_in 'store_access', with: ''
      fill_in 'store_password', with: 'hogepiyo'
      fill_in 'store_password_confirmation', with: 'hogepiyo'
      fill_in 'store_current_password', with: 'password'
      attach_file 'store_image', "#{Rails.root}/spec/factories/profile_image.jpg"
      click_on 'Update'
      expect(page).to have_content 'エラーが発生したため 店舗情報 は保存されませんでした'
    end

    it '編集成功' do
      visit root_url
      fill_in 'store_email', with: 'test@nifty.com'
      fill_in 'store_password', with: 'password'
      click_button 'Log in'
      visit store_path(Store.first.id)
      click_on '編集'
      fill_in 'store_name', with: '築地パン屋さん'
      fill_in 'store_address', with: '築地'
      fill_in 'store_email', with: 'piyopiyo@yahoo.co.jp'
      fill_in 'store_telephone', with: '090-1111-2222'
      fill_in 'store_access', with: '築地駅から隅田川のほうへ6時間'
      fill_in 'store_password', with: 'hogepiyo'
      fill_in 'store_password_confirmation', with: 'hogepiyo'
      fill_in 'store_current_password', with: 'password'
      attach_file 'store_image', "#{Rails.root}/spec/factories/profile_image.jpg"
      click_on 'Update'
      visit store_path(Store.first.id)
      expect(page).to have_content '築地パン屋さん'
      expect(page).to have_content 'piyopiyo@yahoo.co.jp'
      expect(page).to have_content '090-1111-2222'
      expect(page).to have_content '築地駅から隅田川のほうへ6時間'
    end
  end
end