class ApplicationController < ActionController::Base
  before_action :configured_permitted_parameters, if: :devise_controller?

  protected

  def configured_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:[:pesel, :birth_date, :avatar])
  end
end
