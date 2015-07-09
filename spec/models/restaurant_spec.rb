require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  let(:valid_attributes) { {name: "Pies!", slug: "pies_galore"} }

  it "is valid" do
  	restaurant = Restaurant.new(valid_attributes)

  	expect(restaurant).to be_valid
	end

	it 'is invalid without a name' do
		restaurant = Restaurant.new(name: "", slug: "pies_galore")

		expect(restaurant).to_not be_valid
	end

	it "generates a slug if not given one" do
		restaurant = Restaurant.create(name: "Pies!")

		expect(restaurant.slug).to eq("pies")
	end

	it "has a unique restaurant name" do
		restaurant1 = Restaurant.create(valid_attributes)
		restaurant2 = Restaurant.create(name: "Pies!", slug: "pie_store")

		expect(restaurant1).to be_valid
		expect(restaurant2).to_not be_valid
	end

	it 'has a unique slug' do
		restaurant1 = Restaurant.create(valid_attributes)
		restaurant2 = Restaurant.create(name: "Another Pie Store", slug: "pies_galore")

		expect(restaurant1).to be_valid
		expect(restaurant2).to_not be_valid
	end
end
