require 'rails_helper'

RSpec.describe 'OrderSlips', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:store)
    FactoryBot.create(:product)
    FactoryBot.create(:product_image)
    FactoryBot.create(:number_purchase)
    visit root_url
    fill_in 'store_email', with: 'test@nifty.com'
    fill_in 'store_password', with: 'password'
    click_button 'Log in'
  end

  describe '注文伝票' do
    it '注文確定' do
      visit order_slips_path
      click_on '注文確定', match: :first

      expect(page).to have_content '注文を確定しました'
    end
  end


end