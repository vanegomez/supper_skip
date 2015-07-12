require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a restaurant admin viewing the items page', type: :feature do
  let(:restaurant) { Restaurants.create(name: "Pies!", slug: "pies") }

  let(:classics) { Category.create(name: "Classics") }
  let(:savory) { Category.create(name: "Savory") }

  let(:apple_pie) { Item.create(title: "Awesome Apple",
                                description: "Local, organically grown apples, gluten-free",
                                inventory: 10,
                                price_pie: 12.99,
                                category_ids: [classics.id]) }

  let(:keylime_pie) { Item.create(title: "Key-Lime",
                                  description: "Local, organically grown limes, gluten-free",
                                  inventory: 12,
                                  price_pie: 17.99,
                                  category_ids:[savory.id]) }

  let(:role) { Role.create(name: 'admin') }

  let(:user) { User.create!(:full_name     => "john doe",
                            :email         => "john_doe@example.com",
                            :display_name  => "john_doe_123",
                            :password      => 'password',
                            :restaurant_id => restaurant.id
                            :role_ids      => [role.id]) }

#   As a user with a registered restaurant,
# When I visit my restaurant homepage,
# I expect to see all items associated with my restaurant.

	before(:each) do
		allow_any_instance_of(Admin::ItemsController).to receive(:current_user).and_return(user)
	end

	it "shows all items associated with my restaurant" do
		visit restaurants_path


	end
end
