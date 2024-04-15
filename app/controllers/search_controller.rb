class SearchController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @station = FuelStationsFacade.new.station_near_location(params[:location])
    # require 'pry'; binding.pry
    @directions = DirectionsFacade.new.here_to_there(@station.address, params[:location])
    # require 'pry'; binding.pry
  end
end