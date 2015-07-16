class CartsController < ApplicationController
	def show
		@cart = cart
	end

	def update
	end

  def edit
  	# where is this getting called?
  	@item = item
  	Cart.create(@item.id, @item.title, @item.description,  @item.price_pie)
  end

	def add_to_cart_view
		item = Item.find(params[:item_id])
		cart.items << item
    slug = item.categories.first.restaurant.slug
		redirect_to restaurant_items_path(restaurant_slug: slug)
	end
end
