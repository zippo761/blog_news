class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update], if: :devise_controller?

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation,
    # :current_password, :firstname, :middlename, :lastname, :nickname) }
    devise_parameter_sanitizer.permit(:account_update, keys: %i[subscription_type name])
  end

  # The path used after sign up.
  def after_sign_up_path_for(_resource)
    posts_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  # super(resource)
  # end
end
