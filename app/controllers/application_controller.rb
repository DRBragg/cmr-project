class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
   devise_parameter_sanitizer.permit(:account_update) do |params|
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar)
    end
  end
end
