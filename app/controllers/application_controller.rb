class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ApplicationHelper
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_role_user, :set_locale
  layout :determine_layout

  def determine_layout
    if user_signed_in?
      (current_user.admin? ? "application_admin" : "application")
    else
      "application"
    end
  end

  private
  def check_role_user; end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    added_attrs = [:name, :address, :phone_number, :email, :password,
                   :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
