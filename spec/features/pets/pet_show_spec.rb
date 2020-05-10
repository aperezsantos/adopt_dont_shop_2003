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

    it "I can click on a link that lets me update that pet using a form" do
      shelter = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      bishi = shelter.pets.create(image: "https://ih.constantcontact.com/fs159/1104169690227/img/112.jpg?a=1118551010932", name: "Bishi", age: "10", sex: "M", description: "Reserved, but with a mischivous flare about him, he always let's you know what is on his mind.", adoption_status: "Adoptable")

      visit "/pets/#{bishi.id}"

      click_link "Update Pet"

      expect(current_path).to eq("/pets/#{bishi.id}/edit")

      fill_in "image", with: "https://images.pexels.com/photos/881142/pexels-photo-881142.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
      fill_in "name", with: "Updated Pet Name"
      fill_in "age", with: "Updated Pet Age"
      fill_in "sex", with: "Updated Pet Sex"
      fill_in "description", with: "Updated Pet Description"

      click_on "Submit Update"

      expect(current_path).to eq("/pets/#{bishi.id}")
      expect(page).to have_content("Updated Pet Name")
      expect(page).to have_content("Updated Pet Age")
      expect(page).to have_content("Updated Pet Sex")
      expect(page).to have_content("Updated Pet Description")
    end
  end
end

# User Story 11, Pet Update
#
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information


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
