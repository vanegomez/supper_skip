require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user signs in and views their user page', type: :feature do
  let(:user) do
    role = Role.create(name: "customer")

    user = role.users.create!(:full_name   => "john doe",
                 :email        => "john_doe@example.com",
                 :display_name => "john_doe_123",
                 :password     => 'password')
  end

  context "non-admin user functionality" do
    xit 'can login with the correct information' do
      page.visit signin_path
      page.fill_in('Email', with: user.email)
      page.fill_in('Password', with: 'password')
      page.click_button('Sign in')
      expect(page.current_path).to eq(user_path(user))
    end

    xit 'can login and destroy the session or logout' do
      page.visit signin_path
      page.fill_in('Email',    with: user.email)
      page.fill_in('Password', with: 'password')
      page.click_button('Sign in')
      expect(page.current_path).to eq(user_path(user))
      page.click_link('Your Account')
      page.click_link('Sign Out')
      expect(page.current_path).to eq(root_path)

    end
  end

  context "invalid user functionality" do
    it 'cannot login with the incorrect information' do
      page.visit signin_path
      page.fill_in('session[email]',    with: '')
      page.fill_in('session[password]', with: '')
      page.click_button('Sign in')
      expect(page.current_path).to eq(sessions_path)
    end

  end

  it "can view one category with multiple items in it" do
  end

  it "can see more than one category per one item" do
  end

  # need to fill in the above. looks like they ran out of time
  #

end
