class ItemsController < ApplicationController

  def index
    @restaurant = Restaurant.find_by(slug: params[:restaurant_slug])
    # @restaurant = Restaurant.find_by(slug: params[:slug])
    @categories = @restaurant.categories
    @items = @restaurant.items.not_retired
    #(@categories.map {|category| category.items.not_retired_too } + @categories.items.not_retired)
  end

  def show
    @restaurant = Restaurant.find_by(slug: params[:restaurant_slug])
    @item = @restaurant.items.find(params[:id])
  end

end
