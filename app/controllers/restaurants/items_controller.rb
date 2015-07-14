class Restaurant::ItemsController < ApplicationController

  def index
    @categories = Restaurant.find_by(slug: params[:slug]).categories.all
    @items = (@categories.items.not_retired_too + @categories.items.not_retired)
  end

  def show
    @item = Item.find(params[:id])
  end
end
