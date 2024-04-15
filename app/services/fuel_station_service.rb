# class FuelStationService < ApplicationService
#   def self.call_db(path, params = {}) #.get is somones apartement number 
#     response = connection("https://developer.nrel.gov/api/alt-fuel-stations/v1.json").get(path) do |req| 
#       req.params = params #are there any parameters to hit this paramter 
#       req.params[:api_key] = Rails.application.credentials.fuel[:key] # if no key delete this line
#     end
#     parse_data(response) #now we take this response and parse it which is in the parent
#     #then here is what we get back - jsonified data 
#   end
# end


class FuelStationService
  def get_user_station_location_search(address)
    station = get_url("/api/alt-fuel-stations/v1/nearest.json?&location=#{address}&fuel_type=ELEC&limit=1")
    # require 'pry'; binding.pry
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.params[:api_key] = Rails.application.credentials.fuel[:key]
    end
  end
end