class PhotosToPicturesController < ApplicationController
  respond_to :html, :json
  def create
    #Rails.logger.info params[:photos]
    @photos_file = params[:photos][:file].sub(/^data:image\/(png|jpg);base64,/, "")
    @random_photo = Random.rand(2000)
    @cached_name = "cam_to_photo_#{@random_photo}/photo_#{@random_photo}.png"
    @url = "/uploads/tmp/#{@cached_name}"
    Dir.mkdir("#{Rails.root.to_s}/public/uploads/tmp/cam_to_photo_#{@random_photo}")
    File.open("#{Rails.root.to_s}/public#{@url}", "wb") do |file|
      file.write(Base64.decode64(@photos_file))
    end

    respond_with(params[:photos][:file]) do |format|
      format.json {render json: {cached_name: @cached_name, url: @url}}
    end
  end
end
