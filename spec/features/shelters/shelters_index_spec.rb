require 'rails_helper'

RSpec.describe "Shelters Index Spec" do
  describe "as a visitor when I visit the shelters index spec" do
    it "I can see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
      shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

      visit "/shelters"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
      expect(page).to_not have_content(shelter_1.address)
      expect(page).to_not have_content(shelter_1.city)
      expect(page).to_not have_content(shelter_1.state)
      expect(page).to_not have_content(shelter_1.zip)
    end
  end
end



# User Story 2, Shelter Index
#
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system
