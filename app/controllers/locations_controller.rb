class LocationsController < ApplicationController
  def parishes_and_towns    
    c = County.find_by(name: params[:name])
    render json: c.parishes_and_towns_for_grouped_select
  end
end
