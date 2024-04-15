class FuelStationsFacade
  def station_near_location(address_location)
    service = FuelStationService.new
    response = service.get_user_station_location_search(address_location)
    # parsed = response[:fuel_stations].map { |station_info| StationPoro.new(station_info) }
    # require 'pry'; binding.pry
    # station = StationPoro.new(response)
    station = StationPoro.new(response[:fuel_stations].first)
  end
end
