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
    @page_name = t('menu.home')
    @page = Page.where(locale: @locale).where(page_type: 1).first
  end

  def transport
    @pages = Page.where(locale: @locale).where(page_type: 2).order('id asc')
    @page = params[:id].present? ? @pages.where(link_name: params[:id]).first : @pages.first
    unless @page.present?
      redirect_to root_path, alert: t('notice.no_page', category: t('menu.transportation'), language: t(@locale))
    else
      @page_name = params[:id].present? ? @page.title : t('menu.transportation')
    end
  end

  def service
    @pages = Page.where(locale: @locale).where(page_type: 3).order('id asc')
    @page = params[:id].present? ? @pages.where(link_name: params[:id]).first : @pages.first
    unless @page.present?
      redirect_to root_path, alert: t('notice.no_page', category: t('menu.service'), language: t(@locale))
    else
      @page_name = params[:id].present? ? @page.title : t('menu.service')
    end
  end

  def shop
    @pages = Page.where(locale: @locale).where(page_type: 4).order('id asc')
    @page = params[:id].present? ? @pages.where(link_name: params[:id]).first : @pages.first
    unless @page.present?
      redirect_to root_path, alert: t('notice.no_page', category: t('menu.shop'), language: t(@locale))
    else
      @page_name = params[:id].present? ? @page.title : t('menu.shop')
    end
  end

  def contacts
  end
end
