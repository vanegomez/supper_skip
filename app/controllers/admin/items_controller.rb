#inheret from Admin::AdminController and remove 'authorize?' method, check before actions
class Admin::ItemsController < ApplicationController
	before_action :set_restaurant
	before_action	:set_item, only: [:show, :edit, :update, :destroy, :retire]
	before_action :authorize?, only: [:show, :create, :edit, :update, :destroy, :retire]

	def new
		@item = Item.new
	end

	def index
		@restaurant = Restaurant.find_by(slug: params[:restaurant_slug])
		@items = @restaurant.items
	end

  def update
 	# duplicate
		@item = Item.find(params[:id])
  end

	def create
		@item = Item.new(item_params)

		if @item.save
			@item.categories_list(params['item']['categories'])
			flash.notice = 'Item was successfully created.'
			redirect_to admin_item_path(@item)
		else
			render :new
		end
	end

	def show
	end

	def destroy
		if @item.destroy
			redirect_to admin_items_path, notice: 'Item was successfully deleted.'
		end
	end

	private

		def set_restaurant
			@restaurant = Restaurant.find_by(slug: params[:restaurant_slug])
		end

		def set_item
			@item = Item.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:title,
																	:description,
																	:price_pie,
																	:picture,
																	:retire
																	)
		end

		def authorize?
			redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.roles.find_by(name: 'admin').name == "admin"
		end
end
