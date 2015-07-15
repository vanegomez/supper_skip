class RestaurantsController < ApplicationController

  def new
  	@restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:notice] = "Thank you for registering!"
      redirect_to restaurant_path(slug: params[:restaurant][:slug])
    else
      flash[:notice] = "Please try again!"
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find_by(slug: params[:slug])
    redirect_to restaurant_items_path(restaurant_slug: params[:slug])
  end

  def index
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find_by(slug: params[:slug])
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :slug)
    end
end
