class StoresController < ApplicationController
  before_action :authenticate_store!
  before_action :set_store, only: [:show, :edit, :update, :destroy]

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

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
