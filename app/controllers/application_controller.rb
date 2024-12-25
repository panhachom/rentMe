class ApplicationController < ActionController::Base
  include Authentication
  before_action :set_locale

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def switch_locale
    I18n.locale = params[:locale]
    session[:locale] = I18n.locale
    redirect_back(fallback_location: root_path)
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
