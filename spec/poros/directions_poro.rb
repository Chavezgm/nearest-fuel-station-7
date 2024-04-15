require "rails_helper"

RSpec.describe DirectionsPoro do
  describe "initialization" do
    it "exists" do
      attrs = {
        route: {
          distance: 10.5,
          formattedTime: "1 hour 30 minutes", 
          legs: [
            {
              maneuvers: [
                { narrative: "At the next stop turn right" },
                { narrative: "Left turn ahead " }
              ]
            }
          ]
        }
      }

      route = DirectionsPoro.new(attrs)

      expect(route.distance).to eq("10.5 miles")
      expect(route.travel_time).to eq("1 hour 30 minutes")
      expect(route.maneuvers).to eq(["Step 1", "Step 2"])
    end
  end
end
