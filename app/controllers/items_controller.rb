class ItemsController < ApplicationController

  def index
    # byebug
    @restaurant = Restaurant.find_by(slug: params[:restaurant_slug])
    # @restaurant = Restaurant.find_by(slug: params[:slug])
    @categories = @restaurant.categories
    @items = @restaurant.items.not_retired
    #(@categories.map {|category| category.items.not_retired_too } + @categories.items.not_retired)
  end

  def show
    @item = Item.find(params[:id])
  end
end
