class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def new
    @garden = Garden.new
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to gardens_path
    else
      render :new
    end
  end

  def destroy
    @garden = Garden.find(params[:id])
    @garden.destroy
    redirect_to root_path
  end

  private

  def garden_params
    params.require(:garden).permit(:title, :description, :address, :city, :postal_code, :country, :square_meters, :price, :photo)
  end
end
