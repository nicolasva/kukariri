class AttachmentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @uploader = params[:attachment_type]
    PicturesUploader.new
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
