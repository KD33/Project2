class PlacesController < ApplicationController
  #only a logged in user can perform the following actions
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @places = Place.all.page params[:page]
  end


  def new
    @place = Place.new
  end


  def create
    @place = current_user.places.create(place_params)
    puts place_params
    if @place.valid?
      redirect_to root_path
    else
      #render new form and tell browser validation error
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
  end


  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end


  def update
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end


  private

  def place_params
    params.require(:place).permit(:name, :description, :address, :photo)
  end

end
