class AddRestaurantIdToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :restaurant
  end
end
