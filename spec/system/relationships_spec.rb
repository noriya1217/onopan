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

  it '顧客情報表示確認' do
    visit user_info_index_path
    expect(page).not_to have_content 'test tarou'
    visit order_slips_path
    click_on '注文確定', match: :first
    expect(page).to have_content '注文を確定しました'
    click_on '顧客情報'
    expect(page).to have_content 'test tarou'
  end
end