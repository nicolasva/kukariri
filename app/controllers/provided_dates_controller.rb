class ProvidedDatesController < ApplicationController
  respond_to :html, :json
  # GET /provided_dates
  # GET /provided_dates.json
  def index
    @provided_dates = ProvidedDate.where(:item_id => params[:item_id], :contact_id => params[:contact_id])

    respond_with(@provided_dates)
  end

  # GET /provided_dates/1
  # GET /provided_dates/1.json
  def show
    @provided_date = ProvidedDate.find(params[:id])

    respond_with(@provided_date)
  end

  # GET /provided_dates/new
  # GET /provided_dates/new.json
  def new
    @provided_date = ProvidedDate.new

    respond_with(@provided_date)
  end

  # GET /provided_dates/1/edit
  def edit
    @provided_date = ProvidedDate.find(params[:id])

    respond_with(@provided_date)
  end

  # POST /provided_dates
  # POST /provided_dates.json
  def create
    @provided_date = ProvidedDate.new(params[:provided_date])

    respond_with(@provided_date) do |format|
      if @provided_date.save
        format.json { render json: @provided_date, status: :created }
      else
        format.json { render json: @provided_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /provided_dates/1
  # PUT /provided_dates/1.json
  def update
    @provided_date = ProvidedDate.find(params[:id])

    respond_with(@provided_date) do |format|
      if @provided_date.update_attributes(params[:provided_date])
        format.json { render json: @provided_date }
      else
        format.json { render json: @provided_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provided_dates/1
  # DELETE /provided_dates/1.json
  def destroy
    @provided_date = ProvidedDate.find(params[:id])
    @provided_date.destroy

    respond_with(@provided_date)
  end
end
