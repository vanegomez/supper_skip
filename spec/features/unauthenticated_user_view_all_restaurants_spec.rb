require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'unauthenticated user', type: :feature do
  before(:each) do
    Restaurant.create!(name: "Very Sweet", slug: "very-sweet")
    Restaurant.create!(name: "Very Cool", slug: "very-cool")
    Restaurant.create!(name: "Very Interesting", slug: "very-interesting")
  end

  it "can view all restaurants" do
    visit root_path

    expect(Restaurant.count).to eq(3)
  end
end
