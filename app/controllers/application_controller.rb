class ApplicationController < ActionController::Base
  helper_method :authenticate_admin
  before_action :configured_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_admin
    return if current_user.admin?
    redirect_to root_path, notice: 'You are not permitted to delete'
  end

  def configured_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:[:pesel, :birth_date, :avatar])
  end
end
