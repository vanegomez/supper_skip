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

  context "user is logged in" do
    before(:each) do
      allow(ApplicationController).to receive(:current_user) { user }
    end

    it "redirects to a new restaurant page" do
      visit root_path

      expect(page).to have_content("Register a New Restaurant")

      click_link "Register a New Restaurant"
      expect(current_path).to eq(new_restaurant_path)
    end

    xit "lets you register a new restaurant" do
      visit new_restaurant_path

      page.fill_in "Name", with: "Pies!"
      page.fill_in "Slug", with: "pie_slug"

      click_button "Register Restaurant"

      expect(current_path).to eq('/pie_slug')
    end
  end
end
