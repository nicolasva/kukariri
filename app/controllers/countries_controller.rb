class CountriesController < ApplicationController
  def show
    @country = Country.find_country(params[:name])

    respond_to do |format|
      format.json { render json: @country }
    end
  end
end
