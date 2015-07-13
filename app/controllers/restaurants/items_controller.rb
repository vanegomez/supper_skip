class Restaurant::ItemsController < ApplicationController

  def index
    @categories = Category.all
    @items = (Item.not_retired_too + Item.not_retired)
  end

  def show
    @item = Item.find(params[:id])
  end
end
