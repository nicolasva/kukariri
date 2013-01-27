class AttachmentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    #@uploader = case params[:attachment_type]
    #  when "picture" then PicturesUploader.new
    #end
    Rails.logger.info params[:attachment_type]
    if params[:attachment_type] == "vcf_to_contacts"
      @uploader = VcfUploader.new
    else
      @uploader = PicturesUploader.new
    end
    @uploader.cache!(params[:file]) unless params[:file].nil?
    
    respond_to do |format|
      if @uploader.cached?
        format.js {render json: {:url => @uploader.to_s, :cached_name => @uploader.cache_name}}
      else
        format.js {render inline: "",  :status => 406}
      end
    end
  end
end
