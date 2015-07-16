class Restaurant < ActiveRecord::Base
  before_validation :generate_slug
  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  has_many :categories
  has_many :items, through: :categories
  has_many :orders
  #has_many :customers, through: :orders
  has_many :user_roles
  # has_many :users, through: :user_roles #use it if line 11 doesn't work
  has_many :roles, through: :user_roles
  has_many :users

  def generate_slug
    if slug.empty?
      self.slug = name.parameterize
    else
      self.slug = self.slug.parameterize
    end
  end

end
