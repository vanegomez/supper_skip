require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the header view', type: :feature do

  it 'expects the cart number to be one when a item is added' do
    item = Item.create(title: 'Key Lime', description: 'Yum',  price_pie: 50)
    page.visit restaurant_item_path(id: item.id, restaurant_slug: item.restaurant.slug)
    page.click_on('ADD TO CART')
    page.visit restaurant_items_path(restaurant_slug: item.restaurant.slug)
    expect(page).to have_content(1)
  end
end
