class RemoveRestaurantIdFromUserRoles < ActiveRecord::Migration
  def change
    remove_column :user_roles, :restaurant_id, :integer
  end
end
