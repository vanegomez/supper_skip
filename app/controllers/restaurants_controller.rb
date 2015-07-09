class RestaurantsController < ApplicationController
  # include SessionsHelper
  def new
  	@restaurant = Restaurant.new
  end

  def create
  end

  def index
  end

  def edit
  end
end
