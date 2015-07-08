#look for methods that can be extracted to this class from other admin controllers

class Admin::AdminController < ApplicationController
  before_action :authorize?

  def show
  end

  private

    def authorize?
      redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "admin"
    end
end
