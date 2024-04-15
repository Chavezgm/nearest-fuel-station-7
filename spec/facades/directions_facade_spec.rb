require "rails_helper"

RSpec.describe DirectionsFacade, :vcr do
  describe ".here_to_there" do #testing the facade we are calling in the controller!! 
    it "returns info for a map quest route" do
      route_data = DirectionsFacade.new.here_to_there("4567 W 25th Ave, Denver, CO 80214", "5505 W 20th Ave, 80214")
      
      expect(route_data).to be_a(DirectionsPoro)
    end
  end
end

