class Restaurant::CategoriesController < ApplicationController
  before_action :set_restaurant

  def index
    @categories = Restaurant.find_by(slug: params[:slug]).categories.all
  end

  def show
		@category = Category.find(params[:id])
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find_by(slug: params[:restaurant_slug])
    end
end
