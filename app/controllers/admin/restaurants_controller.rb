class Admin::RestaurantsController < ApplicationController
  before_action :authorize?

  def show
    @restaurant = Restaurant.find_by(slug: params[:slug])
  end

  def edit
    @restaurant = Restaurant.find_by(slug: params[:slug])
  end

  def update

  end

  private
  def authorize?
    redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.roles.find_by(name: 'admin').name == "admin"
  end
end
