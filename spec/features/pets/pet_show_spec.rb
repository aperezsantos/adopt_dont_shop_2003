require 'rails_helper'

RSpec.describe "Pet Show Page" do
  describe "as a visitor when I visit a pet's show page" do
    it "I can see that pet's information, inluding adoption status" do
      shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      bishi = shelter_1.pets.create(image: "https://ih.constantcontact.com/fs159/1104169690227/img/112.jpg?a=1118551010932", name: "Bishi", age: "10", sex: "M", description: "Reserved, but with a mischivous flare about him, he always let's you know what is on his mind.", adoption_status: "Adoptable")
      simba = shelter_1.pets.create(image: "https://images.pexels.com/photos/736532/pexels-photo-736532.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260", name: "Simba", age: "2", sex: "M", description: "His love of life and curiosity are so contagious, you'll find yourself wanting to explore the world by his side.", adoption_status: "Pending")

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

    it "I can click a link that deletes that pet, taking me to the pets index page" do
      shelter = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")

      simba = shelter.pets.create(image: "https://images.pexels.com/photos/736532/pexels-photo-736532.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260", name: "Simba", age: "2", sex: "M", description: "His love of life and curiosity are so contagious, you'll find yourself wanting to explore the world by his side.", adoption_status: "Pending")

      visit "/pets/#{simba.id}"

      click_link "Delete Pet"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content(simba.name)
    end
  end
end
