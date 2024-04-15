class StationPoro
  attr_reader :name, :address, :access_times, :fuel_type

  def initialize(station_info)
    # require 'pry'; binding.pry
    # station_attributes = attributes[:fuel_stations].first
    @name = station_info[:station_name]
    @address = "#{station_info[:street_address]}, #{station_info[:zip]}"
    @fuel_type = station_info[:fuel_type_code]
    @access_times = station_info[:access_days_time]
  end
end