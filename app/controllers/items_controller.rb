class ItemsController < ApplicationController

  def index
    @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    @categories = Category.all
    @items = @restaurant.items
  end

  def show
    @item = Item.find(params[:id])
  end
end
