class PicturesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :json
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Item.find(params[:item_id]).pictures.order(:position)

    respond_with(@pictures)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_with(@picture)
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_with(@picture)
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])
    @picture.picture = File.open("#{Rails.root.to_s}/public#{params[:picture][:picture][:current_path]}") 
    @picture.save
    #respond_to do |format|
    #  if @picture.save
    #    format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
    #    format.json { render json: @picture, status: :created }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @picture.errors, status: :unprocessable_entity }
    #  end
    #end
    respond_with(@picture)
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    unless params[:id].nil?
      @picture = Picture.find(params[:id])
      @picture.update_attributes(params[:picture])
      respond_with(@picture)
    else
      params[:pictures_all_sort].each_with_index do |id, index|
        Picture.position(index+1,id.to_i)
      end
      render :nothing => true
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_with(@picture)
  end
end
