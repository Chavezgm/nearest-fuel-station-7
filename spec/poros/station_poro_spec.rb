require "rails_helper"

RSpec.describe StationPoro do
  describe "initialization" do
    it "exists" do
      attrs = 
      
        {
          access_days_time: "24 hours daily",
          fuel_type_code: "ELEC",
          station_name: "Edgewater Public Market - Tesla Supercharger",
          street_address: "5505 W 20th Ave",
          zip: "80214"
        }
    

      station = StationPoro.new(attrs)
      # require 'pry'; binding.pry
      expect(station.access_times).to eq("24 hours daily")
      expect(station.fuel_type).to eq("ELEC")
      expect(station.name).to eq("Edgewater Public Market - Tesla Supercharger")
      expect(station.address).to eq("5505 W 20th Ave, 80214")
    end
  end
end
