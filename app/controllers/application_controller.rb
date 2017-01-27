class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

    # Devise Parameters
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  # Devise Parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :display_name
    #http://stackoverflow.com/questions/19791531/how-to-specify-devise-parameter-sanitizer-for-edit-action
    #allows edit profile to work correctly for updating associated pirate
    devise_parameter_sanitizer.for(:account_update) << :display_name
  end
end
