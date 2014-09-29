class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale_filter
  before_filter :prepare_menu

  def set_locale_filter
    if cookies[:lang] && LOCALES.keys.include?(cookies[:lang])
      @locale = cookies[:lang]
    end

    @locale ||= "ro"

    if cookies[:lang] != @locale
      cookies[:lang] = {:value => @locale, :expires => 1.year.from_now}
    end

    I18n.locale = LOCALES[@locale]
    true
  end

  def prepare_menu
    @transport_pages_links = Page.where(page_type: 2).where(locale: current_language).order('id asc')
    @service_pages_links = Page.where(page_type: 3).where(locale: current_language).order('id asc')
    @shop_pages_links = Page.where(page_type: 4).where(locale: current_language).order('id asc')
  end

  helper_method :current_language

  def current_language
    language = cookies[:lang]
    language = params[:locale] if params[:locale]
    language
  end
end
