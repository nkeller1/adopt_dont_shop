class PetsController < ApplicationController
  def index
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

    private

  def pet_params
    params.permit(:image, :name, :approximate_age, :sex, :description, :adoptable)
  end
end