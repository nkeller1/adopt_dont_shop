#app/controllers/shelters_controllers

class SheltersController < ApplicationController

  def index
    @shelters = ["Mike's Shelter", "Meg's Shelter"]
    # Shelter.all
  end


end
