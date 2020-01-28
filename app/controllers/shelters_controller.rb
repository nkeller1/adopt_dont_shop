#app/controllers/shelters_controllers

class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
    require "pry"; binding.pry
  end
end
