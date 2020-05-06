require 'rails_helper'

RSpec.describe "Shelters Index Page" do
  describe "as a visitor when I visit the shelters index spec" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
      @shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")
    end

    it "I can see the name of each shelter in the system" do
      visit "/shelters"

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)
      expect(page).to_not have_content(@shelter_1.address)
      expect(page).to_not have_content(@shelter_1.city)
      expect(page).to_not have_content(@shelter_1.state)
      expect(page).to_not have_content(@shelter_1.zip)
    end

    it "I can click on a link that lets me create a new shelter using a form" do
      visit "/shelters"

      click_link "New Shelter"

      expect(current_path).to eq("/shelters/new")

      fill_in "name", with: "New Shelter Name"
      fill_in "address", with: "New Shelter Address"
      fill_in "city", with: "New Shelter City"
      fill_in "state", with: "New Shelter State"
      fill_in "zip", with: "New Shelter Zip"

      click_on "Create Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to have_content("New Shelter Name")
    end
  end
end


# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.


# User Story 2, Shelter Index
#
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system
