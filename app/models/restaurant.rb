class Restaurant < ActiveRecord::Base
  before_validation :generate_slug
  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  has_many :items
  has_many :orders
  #has_many :customers, through: :orders
  has_many :user_roles
  has_many :staff, through: :user_roles

  def generate_slug
    if self.slug.nil?
      self.slug = name.parameterize
    else
      self.slug = self.slug.parameterize
    end
  end

end
