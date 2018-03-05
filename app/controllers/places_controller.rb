class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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
    #create a place connected with this user
    current_user.places.create(place_params)
    redirect_to root_path
  end

  private

  def place_params #what pulls the values of name, description and address from the place form
    params.require(:place).permit(:name, :description, :address)
  end

  def show
    @place = Place.find(params[:id]) #pulls the id out of the URL and uses this to find the specific place
    #in the db
  end

end
