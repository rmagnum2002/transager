class WelcomeController < ApplicationController
  def set_locale
    request_language = request.env['HTTP_ACCEPT_LANGUAGE']
    request_language = request_language.nil? ? nil : request_language[/[^,;]+/]

    if LOCALES.keys.include?(l = params[:lang]) && cookies[:lang] != l
      cookies[:lang] = {:value => l, :expires => 1.year.from_now}
    end

    if params[:back] !~ /^\//
      redirect_to root_path
    else
      redirect_to((params[:back]).gsub(/[\r\n]/, ''))
    end
  end

  def index
  end

  def transport
    @pages = Page.where(locale: @locale).where(page_type: 2).order('id asc')
    @page = params[:id].present? ? @pages.where(id: params[:id]).first : @pages.first
  end

  def service
    @pages = Page.where(locale: @locale).where(page_type: 3).order('id asc')
    @page = params[:id].present? ? @pages.where(id: params[:id]).first : @pages.first
  end

  def shop
    @pages = Page.where(locale: @locale).where(page_type: 4).order('id asc')
    @page = params[:id].present? ? @pages.where(id: params[:id]).first : @pages.first
  end

  def contacts
  end
end
