require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) do
    Order.create(user_id: 1, order_total: 100.00, order_type: "pick-up", delivery_address: "1510 Blake Street, Denver, CO 80202", order_status: Order::Status::PAID)
  end

  it 'is valid' do
    expect(order).to be_valid
  end

  it 'is invalid without a user_id' do
    order.user_id = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order total' do
    order.order_total = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order type' do
    order.order_type = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without an order status' do
    order.order_status = nil
    expect(order).to be_valid
  end

  it 'has items' do
    order.items.create(id: 140, title: 'Key Lime', description: 'Yum',  price_pie: 28.00)
    order.items.create(id: 125, title: 'Apple', description: 'Yum',  price_pie: 28.00)
    results = order.items
    expect(results.count).to eq(2)
  end

  it 'displays the counts for each order status type' do
    Order.create(order_status: Order::Status::PAID, user_id: 1, order_total: 23, order_type: "pick-up")
    Order.create(order_status: Order::Status::PAID, user_id: 2, order_total: 12, order_type: "pick-up")
    Order.create(order_status: Order::Status::CANCELLED, user_id: 3, order_total: 15, order_type: "pick-up")

    expect(Order.status_counts[Order::Status::CANCELLED]).to eq(1)
    expect(Order.status_counts[Order::Status::PAID]).to eq(2)
    expect(Order.status_counts[Order::Status::ORDERED]).to eq(0)
  end

  it 'displays the total count for all orders' do
    Order.create(order_status: Order::Status::PAID, user_id: 1, order_total: 23, order_type: "pick-up")
    Order.create(order_status: Order::Status::PAID, user_id: 2, order_total: 12, order_type: "pick-up")
    Order.create(order_status: Order::Status::CANCELLED, user_id: 3, order_total: 15, order_type: "pick-up")

    expect(Order.all_count).to eq(3)
  end

  it 'checks the status of an order' do
    order_1 = Order.create(order_status: Order::Status::PAID, user_id: 1, order_total: 23, order_type: "pick-up")
    order_2 = Order.create(order_status: Order::Status::ORDERED, user_id: 2, order_total: 12, order_type: "pick-up")
    order_3 = Order.create(order_status: Order::Status::CANCELLED, user_id: 3, order_total: 15, order_type: "pick-up")
    order_4 = Order.create(order_status: Order::Status::COMPLETED, user_id: 4, order_total: 10, order_type: "pick-up")

    order_1.paid?
    order_2.ordered?
    order_3.cancelled?
    order_4.complete?
  end

  it 'gives the item quantity' do
    item_1 = order.items.create(id: 140, title: 'Key Lime', description: 'Yum',  price_pie: 28.00)
    item_2 = order.items.create(id: 125, title: 'Apple', description: 'Yum',  price_pie: 28.00)

    quantity_1 = order.item_quantity(item_1.id)
    quantity_2 = order.item_quantity(item_2.id)

    expect(quantity_1).to eq(1)
    expect(quantity_2).to eq(1)
  end

  it 'gives the subtotal of an item' do
    item_1 = order.items.create(id: 140, title: 'Key Lime', description: 'Yum',  price_pie: 28.00)
    item_2 = order.items.create(id: 125, title: 'Apple', description: 'Yum',  price_pie: 22.00)

    subtotal_1 = order.subtotal(item_1.id)
    subtotal_2 = order.subtotal(item_2.id)

    expect(subtotal_1).to eq(28.00)
    expect(subtotal_2).to eq(22.00)
  end
end
