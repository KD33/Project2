class PlacesController < ApplicationController
  def index
    @places = Place.all.page params[:page] #all of the places in our db are in @places variable
  end
end
