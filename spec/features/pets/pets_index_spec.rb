require 'rails_helper'

RSpec.describe "Pets Index Page" do
  describe "as a visitor when I visit the pets index spec" do
    it "I can see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
      shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

      bishi = shelter_1.pets.create(name: "Bishi", age: "10", sex: "M", image: "https://ih.constantcontact.com/fs159/1104169690227/img/112.jpg?a=1118551010932")
      simba = shelter_1.pets.create(name: "Simba", age: "2", sex: "M", image: "https://images.pexels.com/photos/736532/pexels-photo-736532.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260")
      starla = shelter_2.pets.create(name: "Starla", age: "18", sex: "F", image: "https://images.pexels.com/photos/1605481/pexels-photo-1605481.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260")
      jasper = shelter_2.pets.create(name: "Jasper", age: "11", sex: "M", image: "https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260")

      visit "/pets"

      expect(page).to have_content("Pet: #{bishi.name}")
      expect(page).to have_content("Approximate Age: #{simba.age}")
      expect(page).to have_content("Sex: #{starla.sex}")
      expect(page).to have_css("img[src*='#{jasper.image}']")
      expect(page).to have_content("Located at: #{shelter_1.name}")
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
