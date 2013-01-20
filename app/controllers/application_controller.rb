class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :set_locale
  protect_from_forgery


  def set_locale
    lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    if lang.match /^(en|fr)$/
      I18n.locale = lang
    else
      I18n.locale = 'en'
    end
  end
end
