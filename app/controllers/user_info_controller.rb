class UserInfoController < ApplicationController
  before_action :authenticate_store!

  def index
    @store = Store.find(current_store.id)
  end
end
