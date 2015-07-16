require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) do
  	Category.create(id: 1 ,name: "Savory")
  end

  it 'is valid' do
  	expect(category).to be_valid
  end

  it 'is invalid without a name' do
  	category.name = nil

  	expect(category).not_to be_valid
  end

  it 'is invalid without a unique name' do
    category
    category2 = Category.create(name: "Savory")

    expect(category2).to_not be_valid
  end

  it 'knows its items' do
    category.items.create(
    	id: 140,
    	title: 'Key Lime',
    	description: 'Yum',
    	price_pie: 28.00
    	)
    category.items.create(
    	id: 125,
    	title: 'Apple',
    	description: 'Yum',
    	price_pie: 28.00
    	)

    results = category.items

    expect(results.count).to eq(2)
  end

  it 'responds to items' do
    expect(category).to respond_to(:items)
  end

  it 'responds to categorizations' do
    expect(category).to respond_to(:categorizations)
  end

  it 'responds to restaurant' do
    expect(category).to respond_to(:restaurant)
  end
end
