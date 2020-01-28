#app/controllers/shelters_controllers

class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    require "pry"; binding.pry
    @shelter = Shelter.find(params[:id])
  end
end
