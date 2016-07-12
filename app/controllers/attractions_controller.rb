class AttractionsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :min_height, :tickets)
  end

end
