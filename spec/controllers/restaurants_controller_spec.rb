require 'rails_helper'

RSpec.describe RestaurantsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, { :id => 1 }
      expect(response).to be_success
    end
  end

end
