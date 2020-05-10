require 'rails_helper'

RSpec.describe "Shelters Index Page", type: :feature do
  describe "as a visitor when I visit the shelters index spec" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
      @shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

      visit "/shelters"
    end

    it "I can see the name of each shelter in the system" do
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)
      expect(page).to_not have_content(@shelter_1.address)
      expect(page).to_not have_content(@shelter_2.address)
    end

    it "I can click on a link that lets me create a new shelter using a form" do
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

    it "I see an edit link next to each shelter" do
      visit "/shelters"

      expect(page).to have_link("Edit Shelter")
    end

    it "I see a delete link next to each shelter" do
      visit "/shelters"

      expect(page).to have_link("Delete Shelter")
    end

    it "I see that each shelter title is a link to its show page" do
      visit "/shelters"
      click_link @shelter_2.name
      expect(current_path).to eq("/shelters/#{@shelter_2.id}")
    end

    it "I see a Pets Index link" do
      visit '/shelters'
      click_link "Navigate to Pets Index"
      expect(current_path).to eq("/pets")
    end

    it "I see a Shelters Index link" do
      visit '/shelters'
      click_link "Navigate to Shelters Index"
      expect(current_path).to eq("/shelters")
    end
  end

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

# User Story 17, Shelter Links
#
# As a visitor
# When I click on the name a shelter anywhere on the site
# Then that link takes me to that Shelter's show page

# User Story 14, Shelter Delete From Shelter Index Page
#
# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter

#   User Story 13, Shelter Update From Shelter Index Page
#
#   As a visitor
#   When I visit the shelter index page
#   Next to every shelter, I see a link to edit that shelter's info
#   When I click the link
#   I should be taken to that shelters edit page where I can update its information just like in User Story 5
end
