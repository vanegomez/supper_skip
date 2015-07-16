# nest under super admin

class Admin::OrderItemsController < ApplicationController
  before_action :set_restaurant

  def new
    @order      = Order.find(params[:order_id])
    @order_item = OrderItem.new
  end

  def create
    item   = Item.find(params[:item_id])
    @order = Order.find(params[:order_id])
    @order.order_items.create(item)
    redirect_to admin_restaurant_items_path(restaurant_slug: @restaurant.slug)
  end

  def increment
    order_item = OrderItem.find(params[:id])
    @order     = Order.find(params[:order_id])
    @order.items << order_item.item
    redirect_to admin_restaurant_order_path(id: @order.id, restaurant_slug: @restaurant.slug)
  end

  def decrement
    @order = Order.find(params[:order_id])
    order_item = @order.order_items.find(params[:id])
    order_item.delete if order_item
    redirect_to admin_restaurant_order_path(id: @order.id, restaurant_slug: @restaurant.slug)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find_by(params[:restaurant_slug])
    end
end
