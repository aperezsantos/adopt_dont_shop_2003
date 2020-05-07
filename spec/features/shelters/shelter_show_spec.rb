require 'rails_helper'

RSpec.describe "Shelter Show Page" do
  describe "as a visitor when I visit a shelter's show page" do
    it "I can see that shelter's name and location information" do
      shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
      shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
      expect(page).to_not have_content(shelter_2.name)
    end

    it "I can click on a link that lets me update that shelter using a form" do
      shelter = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      visit "/shelters/#{shelter.id}"

      click_link "Update Shelter"

      expect(current_path).to eq("/shelters/#{shelter.id}/edit")

      fill_in "name", with: "Updated Shelter Name"
      fill_in "address", with: "Updated Shelter Address"
      fill_in "city", with: "Updated Shelter City"
      fill_in "state", with: "Updated Shelter State"
      fill_in "zip", with: "Updated Shelter Zip"

      click_on "Submit Update"

      expect(current_path).to eq("/shelters/#{shelter.id}")
      expect(page).to have_content("Updated Shelter Name")
      expect(page).to have_content("Updated Shelter Address")
      expect(page).to have_content("Updated Shelter City")
      expect(page).to have_content("Updated Shelter State")
      expect(page).to have_content("Updated Shelter Zip")
    end
  end
end

# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info


# User Story 3, Shelter Show
#
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip
