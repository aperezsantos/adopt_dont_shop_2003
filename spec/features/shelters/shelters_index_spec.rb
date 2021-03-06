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
end
