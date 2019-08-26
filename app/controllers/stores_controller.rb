class StoresController < ApplicationController
  before_action :set_store, only: [:show]
  before_action :authenticate_store!

  def index
    @store = Store.find(current_store.id)
  end

  def show
    if @store.id != current_store.id
      redirect_to store_path(current_store.id), notice: '他店のプロフィールを参照するのは許可されていません'
    end
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
