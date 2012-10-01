class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items.to_json(:include => {:types => {:include =>[:pictures,:contact]}}) }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item.to_json(:include => {:types => {:include =>[:pictures,:contact]}}) }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    Rails.logger.info params[:item]
    #"title"=>"new title", "types_attributes"=>
    #[{"date_at"=>"null", "date_to"=>"null", "descriptif"=>"Descriptif", 
    #"contacts"=>{"lastname"=>"Lastname", "firstname"=>"Firstname", "email"=>"<email>@<server>.<com,fr>", "tel_home"=>"Home Phone Number", "tel_mobil"=>"Mobile Phone Number", "adress"=>"Adress"}, 
    #"contact"=>{"country"=>"Country"}}]}
    hash_params_item = Hash.new
    hash_params_item["title"] = params[:item][:title]
    hash_params_item["id"] = params[:item][:id]
    hash_params_item["user_id"] = current_user.id
    hash_params_item["types_attributes"] = {"0" => {"id" => params[:item][:types_attributes][0][:id], "date_at" => params[:item][:types_attributes][0][:date_at], "date_to" => params[:item][:types_attributes][0][:date_to], "descriptif" => params[:item][:types_attributes][0][:descriptif]}}
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(hash_params_item)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
