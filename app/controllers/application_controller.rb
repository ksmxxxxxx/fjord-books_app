# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  around_action :switch_locale

  def set_locale
    I18n.locale = locale
  end

  def locale
    @locale ||= params[:locale] || I18n.default_locale
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options(options={})
    options.merge(locale: locale)
  end
end
