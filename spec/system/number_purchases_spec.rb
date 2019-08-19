require 'rails_helper'

RSpec.describe 'NumberPurchase', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:store)
    FactoryBot.create(:product)
    FactoryBot.create(:product_image)
    FactoryBot.create(:number_purchase)
    visit new_store_session_path
    fill_in 'store_email', with: 'test@nifty.com'
    fill_in 'store_password', with: 'password'
    click_button 'Log in'
  end

  describe '注文伝票' do
    it '注文確定及び過去売上伝票確認' do
      visit order_slips_path
      click_on '注文確定', match: :first
      expect(page).to have_content '注文を確定しました'
      click_on '過去売上伝票'
      expect(page).to have_content 'ロスパン10個詰め合わせ'
      click_on 'ロスパン10個詰め合わせ'
      expect(page).to have_content 'test tarou'
    end
  end


end