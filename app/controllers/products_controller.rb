class ProductsController < ApplicationController
  before_action :authenticate_store!
  before_action :set_store

  def index

  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    @product.store_id = current_store.id
    if @product.save
      redirect_to product_path, notice: '新しい商品を作成しました'
    else
      render :new
    end
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
    @store = Store.find(current_store.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name,
      :number,
      :price,
      :content,
      :preservation,
      :how_to_eat,
      :expiration,
      :shipping,
      :remarks,
      :store_id,
      product_images_attributes: [:id, :image, :product_id],
    )
  end
end
