require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a registered owner', type: :feature do
  before(:each) do
    # @restaurant = Restaurant.create!(name: "Very Sweet", slug: "very-sweet" )

    category = Category.create!(name: "Fruity")

    item = category.items.create(title: "Berry", description: "Three berry blend, of in-season, local berries", inventory: 4, price_pie: 29.99, category_ids: [1])


  end

  xit "can view registered restaurant" do
    role = Role.create(name: "customer")
    user = role.users.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", display_name: "j3")
    Restaurant.create!(name: "Very Sweet", slug: "very-sweet" )
    expect(Restaurant.count).to eq(1)

    visit '/very-sweet.html'

    expect(current_path).to eq(restaurant_path(slug: "very-sweet"))
  end
end
