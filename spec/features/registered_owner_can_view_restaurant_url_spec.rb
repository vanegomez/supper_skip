require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a registered owner', type: :feature do
  before(:each) do
    # @restaurant = Restaurant.create!(name: "Very Sweet", slug: "very-sweet" )

    category = Category.create!(name: "Fruity")

    item = category.items.create(title: "Berry", description: "Three berry blend, of in-season, local berries", inventory: 4, price_pie: 29.99, category_ids: [1])

    user = User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", role: :user, display_name: "j3")
  end

  it "can view registered restaurant" do
    restaurant = Restaurant.create!(name: "Very Sweet", slug: "very-sweet" )

    expect(current_path).to eq(restaurant_path(restaurant))
  end
end
