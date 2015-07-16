#inheret from Admin::AdminController and remove 'authorize?' method, check before actions
class Admin::CategoriesController < ApplicationController
	before_action :set_restaurant
	before_action	:set_category, 	only: [:show, :edit, :update, :destroy]
	before_action :authorize?

	def new
		@category = Category.new
	end

	def index
		@categories = @restaurant.categories
	end

	def show
	end

	def edit
	end

	def create
		@category = Category.new(category_params)

		respond_to do |format|
			if @category.save
				format.html { redirect_to admin_restaurant_category_path(id: @category.id, restaurant_slug: @restaurant.slug), notice: 'Category was succesfully created.'}
			else
				format.html { render :new }
			end
		end
	end

	def update
		respond_to do |format|
			if @category.update(category_params)
				format.html { redirect_to admin_restaurant_category_path(id: @category, restaurant_slug: @restaurant.slug), notice: 'Category was successfully updated.'}
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@category.destroy

		redirect_to admin_categories_path
	end

	private

		def set_restaurant
			@restaurant = Restaurant.find_by(slug: params[:restaurant_slug])
		end

		def set_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end

		def authorize?
			redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.roles.find_by(name: 'admin').name == "admin"
		end
end
