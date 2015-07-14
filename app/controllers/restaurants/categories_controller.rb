class Restaurant::CategoriesController < ApplicationController

  def index
    @categories = Restaurant.find_by(slug: params[:slug]).categories.all
  end

  def show
		@category = Category.find(params[:id])
  end
end
