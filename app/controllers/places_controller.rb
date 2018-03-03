class PlacesController < ApplicationController
  def index
    @places = Place.all.page params[:page] #all of the places in our db are in @places variable
  end

  def new
    @place = Place.new #Tell the app what we are building the form for.  Build a blank place, so we can
    #make a form for that particular thing
  end

end
