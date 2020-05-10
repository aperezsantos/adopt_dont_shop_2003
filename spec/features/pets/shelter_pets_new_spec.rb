require 'rails_helper'

RSpec.describe "Shelter Pets Index", type: :feature do
  describe "when I visit a shelters pets index page" do
    before(:each) do
      @shelter = Shelter.create(name: "Foothils Animal Shelter", address: "580 McIntyre St", city: "Golden", state: "CO", zip: "80401")

      @starla = @shelter.pets.create(image: "https://images.pexels.com/photos/1605481/pexels-photo-1605481.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", name: "Starla", age: "18", sex: "F", adoption_status: "Pending")
      @jasper = @shelter.pets.create(image: "https://images.pexels.com/photos/1543793/pexels-photo-1543793.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260", name: "Jasper", age: "11", sex: "M", adoption_status: "Adoptable")
    end

    it "I can click on a link that lets me add a new adoptable pet for that shelter" do
      visit "/shelters/#{@shelter.id}/pets/new"

      fill_in "image", with: "http://1.bp.blogspot.com/-FN50PT1n9KA/Ui5RgNJMTBI/AAAAAAAAeyk/Ns7K6hjkKWQ/s1600/IMG_9531_1_1-731935.JPG"
      fill_in "name", with: "New Pet Name"
      fill_in "age", with: "New Pet Age"
      fill_in "sex", with: "New Pet Sex"
      fill_in "description", with: "New Pet Description"
      fill_in "adoption_status", with: "New Pet Adoption Status"

      click_on "Create Pet"

      new_pet = Pet.last

      expect(current_path).to eq("/shelters/#{@shelter.id}/pets")
      expect(page).to have_content(new_pet.name)
      expect(page).to have_content(new_pet.age)
      expect(page).to have_content(new_pet.sex)
      expect(page).to have_content(new_pet.description)
      expect(page).to have_content(new_pet.adoption_status)
    end

    it "I see an edit link next to each pet" do
      visit "/shelters/#{@shelter.id}/pets"

      expect(page).to have_link("Edit Pet")
    end

    it "I see that each shelter title is a link to its show page " do
      visit "/shelters/#{@shelter.id}/pets"
      click_link @shelter.name
      expect(current_path).to eq("/shelters/#{@shelter.id}")
    end

    it "I see that each pet title is a link to its show page " do
      visit "/shelters/#{@shelter.id}/pets"
      click_link @jasper.name
      expect(current_path).to eq("/pets/#{@jasper.id}")
    end

    it "I see a Pets Index link" do
      visit "/shelters/#{@shelter.id}/pets"
      click_link "Navigate to Pets Index"
      expect(current_path).to eq("/pets")
    end

    it "I see a Shelters Index link" do
      visit "/shelters/#{@shelter.id}/pets"
      click_link "Navigate to Shelters Index"
      expect(current_path).to eq("/shelters")
    end
  end
end
