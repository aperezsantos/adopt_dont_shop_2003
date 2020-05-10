class ShelterPetsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create!(pet_params)
    pet.save

    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  private
  def pet_params
    params.permit(:name, :image, :description, :age, :sex)
  end
end
