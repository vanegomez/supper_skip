#look for methods that can be extracted to this class from other admin controllers

class Admin::AdminController < ApplicationController
  before_action :authorize?

  def show
    @restaurants = current_user.restaurants
  end

  private

    def authorize?
      redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.roles.find_by(name: 'admin').name == "admin"
    end
end
