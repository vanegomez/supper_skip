class Item < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/public/:style/default.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :title,       presence: true, :uniqueness => {:scope => [:restaurant_id]}
  validates :description, presence: true

  has_many  :categorizations
  has_many  :categories, through: :categorizations
  has_one :restaurant, through: :categories

  has_many  :order_items
  has_many  :orders, through: :order_items
  has_many  :cart_items
  has_many  :carts, through: :cart_items

  scope :not_retired, -> { where(retire: false) }
  # scope :not_retired_too, -> { where(retire: 'f') }
  scope :retired, -> { where(retire: true) }

  # def category_names
  #   categories.join(", ")
  # end

  def categories_list(category_list)
    if category_list
      valid_categories = category_list.reject do |cat|
        cat.empty?
      end

      new_or_found_categories = valid_categories.map do |name|
        Category.find_or_create_by(name: name)
      end

      self.categories = new_or_found_categories
    end
  end

  def to_s
    title
  end
end
