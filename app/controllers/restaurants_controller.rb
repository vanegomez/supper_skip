class RestaurantsController < ApplicationController

  def new
  	@restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      current_user.roles << Role.find_by(name: 'admin')

      flash[:notice] = "Thank you for registering!"
      redirect_to admin_restaurant_path(slug: @restaurant.slug)
    else
      flash[:notice] = "Please try again!"
      render :new
    end
  end

  def show
    byebug
    @restaurant = Restaurant.find_by(slug: params[:slug])
    redirect_to restaurant_items_path(restaurant_slug: params[:slug])
  end

  def index
    @restaurants = Restaurant.all
  end


  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :slug)
    end
end
