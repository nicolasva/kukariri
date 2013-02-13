class RegionsController < ApplicationController
  respond_to :json
  def index
    @regions = Region.find_regions(params[:country_name])
    respond_with(@regions)
  end
end
