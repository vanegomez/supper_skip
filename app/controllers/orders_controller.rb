class OrdersController < ApplicationController
  before_action :authorize_customer

  def new
    @order = Order.new
  end

  def show
    set_order
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save!
        @cart.items.each do |item|
          @order.order_items.create!(item_id: item.id, order_id: @order.id)
        end
        cart_destroy
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        render :new
      end
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id,
                                    :order_total,
                                    :order_type,
                                    :delivery_address,
                                    :order_status
                                    )
    end

    def authorize_customer
      unless signed_in?
        redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ"
      end
    end
end
