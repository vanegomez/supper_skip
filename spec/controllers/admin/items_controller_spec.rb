
require 'rails_helper'

RSpec.describe Admin::ItemsController, :type => :controller do
  let(:item) do
    {
      title: "new item",
      description: "new item description",
      price_pie: 0.99
    }
  end

  it 'checks the new action for the form fields' do
    get :new
    expect(assigns(:item)).to be_a_new(Item)
  end
end
