class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user
  add_flash_types :info, :error, :warning


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :telephone, :address, :id_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :telephone, :address, :id_number])
  end

  private
  def set_user
    cookies[:user_id] = current_user.id if current_user
  end
end
