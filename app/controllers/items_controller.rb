class ItemsController < ApplicationController

  def index
    # byebug
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @restaurant = Restaurant.find_by(slug: params[:slug])
    @categories = Restaurant.find_by(slug: params[:slug]).categories.all
    @items = (@categories.items.not_retired_too + @categories.items.not_retired)
  end

  def show
    @item = Item.find(params[:id])
  end
end
