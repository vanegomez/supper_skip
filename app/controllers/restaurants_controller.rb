class RestaurantsController < ApplicationController
  
  def new
  	@restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Thank you for registering!"
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def index
  end

  def edit
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :slug)
    end
end
