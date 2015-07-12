#inheret from Admin::AdminController and remove 'authorize?' method

class Admin::OrdersController < ApplicationController
  before_action	:set_order, except: [:index]
  before_action :authorize?

  def index
    @status_counts = Order.status_counts
    @all_count     = Order.all.count
    if params[:filter]
      @orders = Order.where(order_status: params[:filter])
    else
      @orders = Order.all
    end
  end

  def show
  end

  def destroy
    @order.destroy
    flash.notice = 'Order was successfully destroyed.'

    redirect_to admin_orders_url
  end

# consider grouping status update methods and moving
  def cancel
    @order.order_status = "cancelled"
    @order.save
    redirect_to admin_order_path(@order) #test whether this is necessary
  end

  def pay
    @order.order_status = "paid"
    @order.save
    redirect_to admin_order_path(@order) #test whether this is necessary
  end

  def complete
    @order.order_status = 'completed'
    @order.save
    redirect_to admin_order_path(@order) #test whether this is necessary
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

    def authorize?
      redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.role == "admin"
    end
end
