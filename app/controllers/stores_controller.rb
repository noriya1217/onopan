class StoresController < ApplicationController
  before_action :authenticate_store!

  def index
    @store = Store.find(current_store.id)
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    
  end
end
