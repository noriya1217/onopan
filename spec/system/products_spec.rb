require 'rails_helper'

RSpec.describe 'Products', type: :system do
  before do
    FactoryBot.create(:store)
    FactoryBot.create(:product)
    FactoryBot.create(:product_image)
    visit root_url
    fill_in 'store_email', with: 'test@nifty.com'
    fill_in 'store_password', with: 'password'
    click_button 'Log in'
  end

  describe '商品追加' do
    it '失敗' do
      visit new_product_path
      click_on '登録する'
      expect(page).to have_content 'error'
    end

    it '成功' do
      visit new_product_path
      fill_in 'product_name', with: 'できたてロスパン15個詰め合わせ'
      fill_in 'product_number', with: 10
      fill_in 'product_price', with: 3000
      fill_in 'product_content', with: 'お惣菜パンがてんこもり'
      fill_in 'product_preservation', with: '冷凍保存'
      fill_in 'product_how_to_eat', with: '自分のやりたい食べ方で食べるんだ！'
      fill_in 'product_expiration', with: '自分が大丈夫だと思えばいつまでも大丈夫！'
      fill_in 'product_shipping', with: 'クロネコヤマト便'
      fill_in 'product_remarks', with: '備考は記載しなくてもOKだけどテスト'
      attach_file 'product_product_images_attributes_0_image', "#{Rails.root}/spec/factories/profile_image.jpg"
      click_on '登録する'
      expect(page).to have_content 'できたてロスパン15個詰め合わせ'
      expect(page).to have_content 'お惣菜パンがてんこもり'
      expect(page).to have_content '自分のやりたい食べ方で食べるんだ！'
      expect(page).to have_content 'クロネコヤマト便'
    end
  end

  describe '商品編集' do
    it '失敗' do
      visit edit_product_path(Product.first.id)
      fill_in 'product_name', with: ''
      fill_in 'product_content', with: ''
      click_on '更新する'
      expect(page).not_to have_content '更新パン屋さん'
      expect(page).not_to have_content '更新されたロスパンがてんこもり'
      expect(page).to have_content 'error'
    end

    it '成功' do
      visit edit_product_path(Product.first.id)
      fill_in 'product_name', with: '更新パン屋さん'
      fill_in 'product_content', with: '更新されたロスパンがてんこもり'
      click_on '更新する'
      expect(page).to have_content '更新パン屋さん'
      expect(page).to have_content '更新されたロスパンがてんこもり'
    end
  end
end