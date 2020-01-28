#app/controllers/shelters_controllers

class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
    # ["Mike's Shelter", "Meg's Shelter"]
  end


end
