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
    @garden = Garden.find(params[:id])
  end

  def create
    @garden = Garden.new(garden_params)
    authorize @garden
    if @garden.save
      redirect_to gardens_path
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
    @garden = Garden.find(params[:id])
    @garden.destroy
    redirect_to gardens_path

  end

  private

  def garden_params
    params.require(:garden).permit(:title, :description, :address, :city, :postal_code, :country, :square_meters, :price, :photo)
  end

  def find_garden
    @garden = Garden.find(params[:id])
    authorize @garden
  end
end
