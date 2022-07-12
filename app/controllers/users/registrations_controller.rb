class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update], if: :devise_controller?

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    devise_parameter_sanitizer.permit(:sign_up)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation,
    # :current_password, :firstname, :middlename, :lastname, :nickname) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:subscription_type])
  end
end
