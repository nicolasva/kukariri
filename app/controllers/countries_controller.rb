class CountriesController < ApplicationController
  respond_to :json
  def index
    @country = Country.all_country

    respond_with(@country)
  end

  def show
    @country = Country.find_country(params[:name])

    respond_with(@country)
  end
end
