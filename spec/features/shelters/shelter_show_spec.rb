require 'rails_helper'

RSpec.describe "Shelter Show Page", type: :feature do
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

    it "I can click a link that deletes that shelter, taking me to the index page" do
      shelter = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      visit "/shelters/#{shelter.id}"

      click_link "Delete Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content(shelter.name)
    end

    it "I see a Pets Index link" do
      shelter = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      visit "/shelters/#{shelter.id}"
      click_link "Navigate to Pets Index"
      expect(current_path).to eq("/pets")
    end

    it "I see a Shelters Index link" do
      shelter = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      visit "/shelters/#{shelter.id}"
      click_link "Navigate to Shelters Index"
      expect(current_path).to eq("/shelters")
    end

    it "I see a Shelter Pets Index link" do
      shelter = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      visit "/shelters/#{shelter.id}"
      click_link "Navigate to Shelter Pets Index"
      expect(current_path).to eq("/shelters/#{shelter.id}/pets")
    end
  end


# User Story 21, Shelter Pet Index Link
#
# As a visitor
# When I visit a shelter show page ('/shelters/:id')
# Then I see a link to take me to that shelter's pets page ('/shelters/:id/pets')

# User Story 20, Shelter Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Shelter Index

# User Story 19, Pet Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Pet Index
#
end
