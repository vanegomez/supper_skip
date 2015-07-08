class Restaurant < ActiveRecord::Base
	before_validation :generate_slug
	validates :name, presence: true

	def generate_slug
		self.slug = name.parameterize if self.slug.nil?
	end


end
