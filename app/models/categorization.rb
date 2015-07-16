class Categorization < ActiveRecord::Base
  belongs_to :item
  belongs_to :category

  validate :item_id, uniqueness: {scope: :category_id}
end
