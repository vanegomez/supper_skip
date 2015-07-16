class RemoveRestaurantIdFromOrderItems < ActiveRecord::Migration
  def change
    remove_reference(:order_items, :restaurant, index: true)
  end
end
