require 'rails_helper'

RSpec.describe "Pets Index Page" do
  describe "as a visitor when I visit the pets index spec" do
    it "I can see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
      shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

      bishi = shelter_1.pets.create(name: "Bishi", age: "10", sex: "M", image: "insert image here")
      simba = shelter_1.pets.create(name: "Simba", age: "2", sex: "M", image: "insert image here")
      starla = shelter_2.pets.create(name: "Starla", age: "18", sex: "F", image: "insert image here")
      jasper = shelter_2.pets.create(name: "Jasper", age: "11", sex: "M", image: "insert image here")

      visit "/pets"

      expect(page).to have_content(bishi.name)
      expect(page).to have_content(simba.age)
      expect(page).to_not have_content(starla.sex)
      expect(page).to_not have_content(shelter.name)
      expect(page).to_not have_content(jasper.image)
    end
  end
end

# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
