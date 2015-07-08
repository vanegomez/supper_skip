
require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) do
    {
      full_name: "John Q",
      display_name: "JQ",
      email: "john@example.com",
      password: "password",
      password_confirmation: "password"
    }
  end

  it 'checks the new action for the form fields' do
    get :new
    expect(assigns(:user)).to be_a_new(User)
  end


end
