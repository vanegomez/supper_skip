require 'rails_helper'

RSpec.describe Admin::ItemsController, :type => :controller do
  include SessionsHelper

  let(:item) do
    {
      title: "new item",
      description: "new item description",
      price_pie: 0.99
    }
  end

  let(:user) do
    User.create!(
      :full_name   => "john doe",
      :email        => "john_doe@example.com",
      :display_name => "john_doe_123",
      :password     => 'password',
      :role         => "admin")
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "GET new" do
    it 'checks the new action for the form fields' do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, {:item => item}
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, {:item => item}
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it "redirects to the created item" do
        post :create, {:item => item}
        expect(response).to redirect_to admin_item_path(Item.last)
      end

      it "redirects to the new item page" do
        post :create, {:item => {name: "", description: "", price_pie: 0}}
        expect(response).to render_template(:new)
      end

    end
  end
end
