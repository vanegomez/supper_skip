require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  let(:user) do
    User.create!( :full_name    => "mary ann",
                  :email        => "mary_ann@example.com",
                  :display_name => "mary_ann_123",
                  :password     => 'password')
  end

  let(:valid_attributes) do
    {
      user_id:          1,
      order_total:      23.21,
      order_type:       "pick-up",
      delivery_address: "yo moms",
      order_status:     "paid"
    }
  end

  let(:valid_session) { {} }

  before(:each) do
    allow_any_instance_of(OrdersController).to receive(:current_user).and_return(user)
  end

  describe "GET show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "GET new" do
    it "assigns a new order as @order" do
      get :new, {}, valid_session
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, {:order => valid_attributes}, valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, {:order => valid_attributes}, valid_session
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the created order" do
        post :create, {:order => valid_attributes}, valid_session
        expect(response).to redirect_to(Order.last)
      end
    end
  end
end
