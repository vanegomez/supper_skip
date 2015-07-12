class RemoveRestaurantIdFromItems < ActiveRecord::Migration
  def change
    remove_reference :items, :restaurants
  end
end
