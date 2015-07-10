require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a registered owner', type: :feature do
  before(:each) do
    # @restaurant = Restaurant.create!(name: "Very Sweet", slug: "very-sweet" )

    category = Category.create!(name: "Fruity")

    item = category.items.create(title: "Berry", description: "Three berry blend, of in-season, local berries", inventory: 4, price_pie: 29.99, category_ids: [1])


  end

  it "can view registered restaurant" do
    user = User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", role: :user, display_name: "j3")
    user.restaurants.create!(name: "Very Sweet", slug: "very-sweet" )

    expect(Restaurant.count).to eq(1)

    visit '/very-sweet.html'

    expect(current_path).to eq(restaurant_path(slug: "very-sweet"))
  end
end