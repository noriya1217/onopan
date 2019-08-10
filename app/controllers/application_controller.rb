class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    '/stores'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :telephone, :start_time, :end_time, :access, :image, :image_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :telephone, :start_time, :end_time, :access, :image, :image_cache])
  end
end
