class RidesController < ApplicationController

  def new
    @ride = Ride.new
    @ride.user = User.find(params[:user_id])
    @ride.attraction = Attraction.find(params[:attraction_id])
    if @ride.save
      redirect_to user_path(@ride.user), :notice => @ride.take_ride
    else
      redirect_to user_path(@ride.user)
    end
  end

end
