require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user can register a restaurant', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                :email        => "john_doe@example.com",
                :display_name => "john_doe_123",
                :role         => "user",
                :password     => 'password',
                :password_confirmation => 'password')
  end

  it "only allows a user to see link to register a restaurant if they are logged in" do
    visit root_path

    expect(page).to_not have_link "Register a New Restaurant"
  end

  context "user is logged in" do
    # before { allow(controller).to receive(:current_user) { user } }

    before(:each) do
      allow(ApplicationController).to receive(:current_user) { user }
    end

    it "redirects to a new restaurant page" do
      visit root_path
      # expect(page).to have_content("Register a New Restaurant")

      click_link "Register a New Restaurant"

      expect(current_path).to eq(new_restaurant_path)
    end

    it "lets you register a new restaurant" do
      visit new_restaurant_path

      page.fill_in "restaurant[name]", with: "Pies!"
      page.fill_in "restaurant[slug]", with: "pie_slug"

      click_button "Create Restaurant"

      expect(current_path).to eq('/pie_slug')
    end
  end
end
