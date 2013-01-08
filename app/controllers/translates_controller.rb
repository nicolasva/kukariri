class TranslatesController < ApplicationController
  def index
    params[:lang] ||= extract_locale_from_accept_language_header 
    lang = params[:lang].split("-").first or params[:lang]
    I18n.backend.send(:init_translations)
    translations = I18n.backend.send(:translations)
    respond_to do |format|
      format.json { render json: translations[:"#{lang}"]}
    end
  end

  protected

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'] ? request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first : "en"
  end
end 
