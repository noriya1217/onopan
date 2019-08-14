class NumberPurchasesController < ApplicationController
  before_action :authenticate_store!
  
  def index
    product_ids = Product.where(store_id: current_store.id).ids
    @number_purchases = NumberPurchase.where(product_id: product_ids, permission: true).order(updated_at: :asc)
  end

  def show
    @number_purchase = NumberPurchase.find(params[:id])
  end
end
