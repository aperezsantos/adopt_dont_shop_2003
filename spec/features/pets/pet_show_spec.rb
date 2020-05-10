require 'rails_helper'

RSpec.describe "Pet Show Page" do
  describe "as a visitor when I visit a pet's show page" do
    it "I can see that pet's information, inluding adoption status" do
      shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      bishi = shelter_1.pets.create(name: "Bishi", age: "10", sex: "M", description: "Reserved, but with a mischivous flare about him, he always let's you know what is on his mind.", adoption_status: "Adoptable", image: "https://ih.constantcontact.com/fs159/1104169690227/img/112.jpg?a=1118551010932")
      simba = shelter_1.pets.create(name: "Simba", age: "2", sex: "M", description: "His love of life and curiosity are so contagious, you'll find yourself wanting to explore the world by his side.", adoption_status: "Pending", image: "https://images.pexels.com/photos/736532/pexels-photo-736532.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260")

      visit "/pets/#{bishi.id}"

      expect(page).to have_content(bishi.name)
      expect(page).to have_content("Description: #{bishi.description}")
      expect(page).to have_content("Adoption Status: #{bishi.adoption_status}")
      expect(page).to_not have_content(simba.name)
    end
  end
end

# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
