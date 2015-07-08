require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user can register a restaurant', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                :email        => "john_doe@example.com",
                :display_name => "john_doe_123",
                :role         => "user",
                :password     => 'password')
  end

  it "only allows a user to register a restaurant if they are logged in" do
    visit root_path

    expect(page).to_not have_link "Register a New Restaurant"
  end

  context "user is logged in" do
    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "redirects to a new restaurant page" do
      visit root_path

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
