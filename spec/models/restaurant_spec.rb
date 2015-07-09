require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  let(:valid_attributes) { {name: "Pies!", slug: "pies_galore"} }

  it "is valid" do
    restaurant = Restaurant.new(valid_attributes)

    expect(restaurant).to be_valid
  end

  it 'is invalid without a name' do
    restaurant = Restaurant.new(name: "", slug: "pies_galore")

    expect(restaurant).to_not be_valid
  end

  it "generates a slug if not given one" do
    restaurant = Restaurant.create(name: "Pies!")

    expect(restaurant.slug).to eq("pies")
  end

  it "ensures a slug is valid if given" do
    restaurant = Restaurant.create(name: "Pies!", slug: "asdf&# asd")

    expect(restaurant.slug).to eq("asdf-asd")
  end

  it "has a unique restaurant name" do
    restaurant1 = Restaurant.create(valid_attributes)
    restaurant2 = Restaurant.create(name: "Pies!", slug: "pie_store")

    expect(restaurant1).to be_valid
    expect(restaurant2).to_not be_valid
  end

  it 'has a unique slug' do
    restaurant1 = Restaurant.create(valid_attributes)
    restaurant2 = Restaurant.create(name: "Another Pie Store", slug: "pies_galore")

    expect(restaurant1).to be_valid
    expect(restaurant2).to_not be_valid
  end

  context 'relationships' do
    it 'has many items' do
      restaurant = Restaurant.create(valid_attributes)
      category = Category.create(name: "You Put That In A Pie?")
      item1 = Item.create(title: "Awesome Apple", description: "Local, organically grown apples, gluten-free",
                          inventory: 10, price_pie: 12.99, category_ids: [category.id], restaurant: restaurant)
      item2 = Item.create(title: "Delicious Apple", description: "Local, organically grown apples, gluten-free",
                          inventory: 10, price_pie: 12.99, category_ids: [category.id], restaurant: restaurant)

      expect(restaurant.items).to eq([item1, item2])
    end

    it 'has many orders' do
      restaurant = Restaurant.create(valid_attributes)
      user = User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", role: :user, display_name: "j3")
      order1 = Order.create(user: user, order_total: 15, order_type: "pick-up", delivery_address: nil, order_status: "completed", restaurant: restaurant)
      order2 = Order.create(user: user, order_total: 15, order_type: "pick-up", delivery_address: nil, order_status: "completed", restaurant: restaurant)

      expect(restaurant.orders).to eq([order1, order2])
    end

    xit 'has many staff through user roles' do # user roles and roles table need to be created
      restaurant = Restaurant.create(valid_attributes)
      staff1 = User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", role: "staff", display_name: "j3")
      staff2 = User.create(full_name: "Jack", email: "demo+jack@jumpstartlab.com", password: "password", role: "staff", display_name: "jack")

      expect(restaurant.staff).to eq([staff1, staff2])
    end
  end
end
