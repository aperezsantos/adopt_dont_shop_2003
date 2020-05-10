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

    it "I see that each pet title is a link to its show page " do
      visit "/pets"
      click_on @simba.name
      expect(current_path).to eq("/pets/#{@simba.id}")
    end

    it "I see a Pets Index link" do
      visit "/pets"
      click_link "Navigate to Pets Index"
      expect(current_path).to eq("/pets")
    end

    it "I see a Shelters Index link" do
      visit "/pets"
      click_link "Navigate to Shelters Index"
      expect(current_path).to eq("/shelters")
    end
  end
end
