class StoresController < ApplicationController
  before_action :set_store, only: [:show]
  before_action :authenticate_store!

  def index
    @store = Store.find(current_store.id)
  end

  def show; end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end