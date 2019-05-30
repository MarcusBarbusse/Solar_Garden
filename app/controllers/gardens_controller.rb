class GardensController < ApplicationController
  before_action :find_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = policy_scope(Garden)
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def show
    @markers =
      {
        lat: @garden.latitude,
        lng: @garden.longitude
      }
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    authorize @garden
    if @garden.save!
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

 def edit

 end

  def update
    @garden.update(garden_params)
    if @toy.save!
      redirect_to garden_path(@garden)
    else render :new
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  private

  def garden_params
    params.require(:garden).permit(:title, :description, :address, :square_meters, :price, :photo)
  end

  def find_garden
    @garden = Garden.find(params[:id])
    authorize @garden
  end
end
