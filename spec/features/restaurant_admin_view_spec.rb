require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a restaurant admin viewing the items page', type: :feature do
  let!(:restaurant) { Restaurant.create(name: "Pies!", slug: "pies") }

  let!(:classics) { Category.create(name: "Classics") }

  let!(:apple_pie) { Item.create(title: "Awesome Apple",
                                description: "Local, organically grown apples, gluten-free",
                                inventory: 10,
                                price_pie: 12.99,
                                category_ids: [classics.id]) }

  let!(:keylime_pie) { Item.create(title: "Key-Lime",
                                  description: "Local, organically grown limes, gluten-free",
                                  inventory: 12,
                                  price_pie: 17.99,
                                  category_ids:[classics.id]) }

  let!(:role) { Role.create(name: 'admin') }

  let!(:user) { User.create!(:full_name     => "mary jane",
                            :email         => "mary_jane@example.com",
                            :display_name  => "mary_jane_123",
                            :password      => 'password',
                            :restaurant_id => restaurant.id,
                            :role_ids      => [role.id]) }

	before(:each) do
		allow_any_instance_of(Admin::ItemsController).to receive(:current_user).and_return(user)
	end

	it "shows all items associated with my restaurant" do
		visit restaurant_path('pies')

    within('.container-fluid') do
      expect(page).to have_content('Awesome Apple')
      expect(page).to have_content('Key-Lime')
    end
	end
end
