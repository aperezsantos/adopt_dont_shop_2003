require 'rails_helper'

RSpec.describe "Pets Index Page", type: :feature do
  describe "as a visitor when I visit the pets index spec" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Cat Care Society", address: "5787 W 6th Ave", city: "Lakewood", state: "CO", zip: "80214")
      @shelter_2 = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

      @bishi = @shelter_1.pets.create(image: "https://ih.constantcontact.com/fs159/1104169690227/img/112.jpg?a=1118551010932", name: "Bishi", age: "10", sex: "M", adoption_status: "Adoptable")
      @simba = @shelter_1.pets.create(image: "https://images.pexels.com/photos/736532/pexels-photo-736532.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=3&amp;h=750&amp;w=1260", name: "Simba", age: "2", sex: "M", adoption_status: "Pending")
      @starla = @shelter_2.pets.create(image: "https://images.pexels.com/photos/1605481/pexels-photo-1605481.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", name: "Starla", age: "18", sex: "F", adoption_status: "Pending")
      @jasper = @shelter_2.pets.create(image: "https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", name: "Jasper", age: "11", sex: "M", adoption_status: "Adoptable")

      visit "/pets"
    end

    it "I can see the name of each shelter in the system" do
      expect(page).to have_content("Pet: #{@bishi.name}")
      expect(page).to have_content("Approximate Age: #{@simba.age}")
      expect(page).to have_content("Sex: #{@starla.sex}")
      expect(page).to have_css("img[src*='#{@jasper.image}']")
      expect(page).to have_content("Located at: #{@shelter_1.name}")
    end

    it "I see an edit link next to each pet" do
      visit "/pets"

      expect(page).to have_link("Edit Pet")
    end

    it "I see a delete link next to each pet" do
      visit "/pets"

      expect(page).to have_link("Delete Pet")
    end
  end

# User Story 16, Pet Delete From Pets Index Page
#
# As a visitor
# When I visit the pets index page or a shelter pets index page
# Next to every pet, I see a link to delete that pet
# When I click the link
# I should be taken to the pets index page where I no longer see that pet

# User Story 15, Pet Update From Pets Index Page
#
# As a visitor
# When I visit the pets index page or a shelter pets index page
# Next to every pet, I see a link to edit that pet's info
# When I click the link
# I should be taken to that pets edit page where I can update its information just like in User Story 11
end
