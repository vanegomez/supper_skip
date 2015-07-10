class RestaurantsController < ApplicationController
  
  def new
  	@restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Thank you for registering!"
      redirect_to restaurant_path(slug: @restaurant.slug)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find_by(slug: params[:restaurant])
  end

  def index
  end

  def edit
    @restaurant = Restaurant.find_by(slug: params[:restaurant])
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :slug)
    end
end
