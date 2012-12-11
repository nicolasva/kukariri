class TypesController < ApplicationController
  respond_to :html, :json
  # GET /types
  # GET /types.json
  def index
    @types = Type.all

    respond_with(@types)
  end

  # GET /types/1
  # GET /types/1.json
  def show
    @type = Type.find(params[:id])

    respond_with(@type)
  end

  # GET /types/new
  # GET /types/new.json
  def new
    @type = Type.new

    respond_with(@type)
  end

  # GET /types/1/edit
  def edit
    @type = Type.find(params[:id])
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(params[:type])
    @type.save
    respond_with(@type)
  end

  # PUT /types/1
  # PUT /types/1.json
  def update
    @type = Type.find(params[:id])
    @type.update_attributes(params[:type])
    respond_with(@type)
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_with(@type)
  end
end
