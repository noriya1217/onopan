class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_action_all, if: :store_signed_in?
  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  protected

  def after_sign_in_path_for(resource)
    '/stores'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :telephone, :start_time, :end_time, :access, :image, :image_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :telephone, :start_time, :end_time, :access, :image, :image_cache])
  end

  def set_action_all
    @store = Store.find(current_store.id)
    product_ids = Product.where(store_id: current_store.id).ids
    @number_purchases_count = NumberPurchase.where(product_id: product_ids, permission: false).size
  end
end
