require 'rails_helper'

RSpec.describe 'root path', type: :feature do

  # require 'pry'; binding.pry
  describe 'As a visitor' do
    before(:each) do 
      @station = {
        "id": 302537,
        "station_name": "Edgewater Public Market - Tesla Supercharger",
        "city": "Edgewater",
        "country": "US",
        "state": "CO",
        "street_address": "5505 W 20th Ave",
        "zip": "80214",
        "access_days_time": "24 hours daily",
        "fuel_type_code": "ELEC",
  
      }
      # require 'pry'; binding.pry
    end
    it 'should see the closest electric fuel station to Griffin Coffee', :vcr do
      # When I visit "/"
      visit root_path 
      # And I select "Griffin Coffee" form the start location drop down (Note: Use the existing search form)
      select "Griffin Coffee", from: :location
      # And I click "Find Nearest Station"
      click_button("Find Nearest Station")
      # Then I should be on page "/search"
      expect(current_path).to eq(search_path)
      # Then I should see the closest electric fuel station to Griffin Coffee.
      
      within '.nearest_stations' do
        expect(page).to have_content("Nearest Station")

        # For that station I should see
        # - Name
        expect(page).to have_content("Station Name: Edgewater Public Market - Tesla Supercharger")
        # - Address
        expect(page).to have_content("Address: 5505 W 20th Ave, 80214")
        # - Fuel Type
        expect(page).to have_content("Fuel Type: ELEC")
        # - Access Times
        expect(page).to have_content("Access Times: 24 hours daily")
        # save_and_open_page
        # - the distance of the nearest station (expressed 0.1 miles)
        expect(page).to have_content("Distance to Station: 0.7 miles")

        expect(page).to have_content("Travel Time: 00:03:14")
        # - the travel time from Griffin Coffee to that fuel station (expressed in human-readable format e.g. "12 minutes" or "0:12")

        expect(page).to have_content("Directions:")
        # - The direction instructions to get to that fuel station
        #   e.g. "Turn left onto Lawrence St., Destination will be on the left"
        
      end
    end
  end
end
