require 'rails_helper'

RSpec.describe SampleController, type: :controller do

  describe "GET #starter" do
    it "returns http success" do
      get :starter
      expect(response).to have_http_status(:success)
    end
  end

end
