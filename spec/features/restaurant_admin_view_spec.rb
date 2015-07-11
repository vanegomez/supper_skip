require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a restaurant admin viewing the items page', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                :email        => "john_doe@example.com",
                :display_name => "john_doe_123",
                :role         => "admin",
                :password     => 'password')
  end

  let(:restaurant) {
  	Restaurants.create(name: "Pies!", slug: "pies")
  }

#   As a user with a registered restaurant,
# When I visit my restaurant homepage,
# I expect to see all items associated with my restaurant.

	before(:each) do
		allow_any_instance_of(Admin::ItemsController).to receive(:current_user).and_return(user)
	end

	it "" do
		visit admin_items_path
	end
end
