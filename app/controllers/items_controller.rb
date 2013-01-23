class ItemsController < ApplicationController
  respond_to :html, :json
  # GET /items
  # GET /items.json
  def index
    @items = Item.where(:user_id => current_user.id).all
    respond_with(@items)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_with(@item) do |format| 
      format.json {render json: @item.to_json(:include => {:types => {:include =>[:pictures,:contact]}})}
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new(:user_id => current_user.id)

    respond_with(@item)
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])

    respond_with(@item)
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(:title => params[:item][:title], :user_id => current_user.id)
    respond_with(@item) do |format|
      if @item.save_new
        format.json { render json: @item, status: :created }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    hash_params_item = Hash.new
    hash_params_item["title"] = params[:item][:title]
    hash_params_item["id"] = params[:id]
    hash_params_item["user_id"] = current_user.id
    @item = Item.find(params[:id])
    respond_with(@item) do |format|
      if @item.update_attributes(params[:item])
        format.json { render json: @item }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_with(@item)
  end
end
