class OrderSlipsController < ApplicationController
  before_action :set_order_slip, only: [:update]
  before_action :authenticate_store!


  def index
    product_ids = Product.where(store_id: current_store.id).ids
    @number_purchases = NumberPurchase.where(product_id: product_ids, permission: false).order(created_at: :asc)
  end

  def update
    # binding.pry
    if @order_slip.update_attribute(:permission, true)
      client
      user_id = @order_slip.user.line_id
      message = {
        type: 'text',
        text: "#{Store.find(current_store.id).name}から「#{@order_slip.product.name}」のご注文確定されました。"
      }
      client.push_message(user_id, message)
      Relationship.create(user_id: @order_slip.user.id, store_id: @order_slip.product.store.id)
      redirect_to order_slips_path, notice: "#{@order_slip.user.name}様：#{@order_slip.product.name}の注文を確定しました。"
    else
      render :index
    end
  end

  private

  def set_order_slip
    @order_slip = NumberPurchase.find(params[:id])
  end
end
