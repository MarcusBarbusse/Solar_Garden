class GardensController < ApplicationController
  before_action :find_garden, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:search_query].present?
      sql_query = " \
      gardens.address @@ :query \
      OR gardens.category @@ :query \
      OR gardens.title @@ :query \
      "
      @gardens = policy_scope(Garden.where(sql_query, query: "%#{params[:search_query]}%"))
    else
      @gardens = policy_scope(Garden)
    end
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def show
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    authorize @garden
    if @garden.square_meters < 100
      @garden.category = "small"
    elsif @garden.square_meters > 100 && @garden.square_meters < 200
      @garden.category = "medium"
    elsif @garden.square_meters > 200 && @garden.square_meters < 500
      @garden.category = "large"
    elsif @garden.square_meters > 500
      @garden.category = "extra large"
    end
    if @garden.save!
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit; end

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
    params.require(:garden).permit(:title, :description, :address, :square_meters, :price, :photo, :category)
  end

  def find_garden
    @garden = Garden.find(params[:id])
    authorize @garden
  end
end
