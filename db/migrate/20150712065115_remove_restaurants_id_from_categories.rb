class RemoveRestaurantsIdFromCategories < ActiveRecord::Migration
  def change
    remove_reference :categories, :restaurants
  end
end
