class AddColumnRestaurantIdToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :restaurant, index: true
  end
end
