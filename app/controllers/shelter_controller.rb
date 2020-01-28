#app/controllers/shelter_controllers

class ShelterController < ApplicationController

  def index
    @shelters = Shelter.all
  end


end
