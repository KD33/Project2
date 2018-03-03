class PlacesController < ApplicationController
  def index
    @places = Place.all.page params[:page] #all of the places in our db are in @places variable
  end

  def new
    @place = Place.new #Tell the app what we are building the form for.  Build a blank place, so we can
    #make a form for that particular thing
  end

  def create
    #pressing submit on the form triggers the create action
    #all the code here will get executed when the user hits create
    Place.create(place_params)
    redirect_to root_path
  end

  private

  def place_params #what pulls the values of name, description and address from the place form
    params.require(:place).permit(:name, :description, :address)
  end

end
