class RemoveRestaurantIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :restaurant_id, :integer
  end
end
