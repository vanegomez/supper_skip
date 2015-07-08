
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

  describe "POST create" do
    describe "with valid params" do
      it 'creates a new User' do
        expect {
          post :create, {:user => user}
        }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, {:user => user}
          expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, {:user => user}
          expect(response).to redirect_to(User.last)
      end
    end
  end
end
