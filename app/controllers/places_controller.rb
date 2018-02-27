class PlacesController < ApplicationController
  def index
    @places = Place.all #all of the places in our db are in @places variable
  end
end
