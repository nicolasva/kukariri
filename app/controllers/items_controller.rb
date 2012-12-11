class ItemsController < ApplicationController
  respond_to :html, :json
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    respond_with(@items)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @item.to_json(:include => {:types => {:include =>[:pictures,:contact]}}) }
    #end
    respond_with(@item) do |format| 
      format.json {render json: @item.to_json(:include => {:types => {:include =>[:pictures,:contact]}})}
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_with(@item)
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.save
    respond_with(@item)
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    hash_params_item = Hash.new
    hash_params_item["title"] = params[:item][:title]
    hash_params_item["id"] = params[:id]
    hash_params_item["user_id"] = current_user.id
    hash_params_item["types_attributes"] = {"0" => {"id" => params[:item][:types_attributes][0][:id], "item_id" => params[:id], "date_at" => params[:item][:types_attributes][0][:date_at], "date_to" => params[:item][:types_attributes][0][:date_to], "descriptif" => params[:item][:types_attributes][0][:descriptif]}}
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    respond_with(@item)
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_with(@item)
  end
end
