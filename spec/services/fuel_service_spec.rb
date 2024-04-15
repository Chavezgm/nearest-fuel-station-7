require "rails_helper"

RSpec.describe FuelStationService, vcr: true do
  describe ".station_location_search" do
    it "returns a single station by input location" do
      station = FuelStationService.new.get_user_station_location_search("5224 W 25th Ave, Denver, CO 80214")
      # require 'pry'; binding.pry
      expect(station).to be_a(Hash)
    end
  end
end