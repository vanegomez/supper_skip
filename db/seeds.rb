
food_themes = ["Potato Skins", "tacos", "Twix", "Jalapeno Poppers", "Donuts", "Twinkies",
               "Pie", "Ice Cream", "Cake", "Fried Chicken", "Chips", "Nerds",
               "AirHeads", "Cheetos", "Nachos", "Fried cheese", "Pizza", "Milkshakes",
               "Ranch dressing", "Whipped cream", "Cookie dough", "Red Vines", "Snickers",
               "Popsicles", "Gummy Worms", "Hot Tamales", "Sour Patch Kids", "Burritos", "Big Chew",
               "Oreos"]

names = ["Sally's", "Steve's", "Tan's", "Tom's", "Vanessa's", "Will's", "Andrew's", "Justin's",
         "Morgan's", "Chelsea's", "DJ's", "Rachel's", "Rebekah's", "Brett's", "Tracy's", "Mihir's",
         "Michelle's", "Drew's", "Jorge's", "Lev's", "Lovisa's", "Margarett's", "Michael's", "Robert's",
         "Tino's", "Drew's", "Trey's", "Kenny's", "David's", "Whitney's"]

restaurant_names = names.zip(food_themes).map { |name| name.join(" ")}

all_restaurants = restaurant_names.map do |theme|
  Restaurant.create!(name: "#{theme}", slug: "#{theme.parameterize}")
end

all_categories = ["category1","category2","category3","category4","category5"]

nums = 0
all_restaurants.map do |restaurant|
  all_categories.each do |category|
    cat = Category.create!(name: "#{category}", restaurant_id: restaurant.id)
    cat.items.create!(title: "item#{nums += 1}", description: "item1 description", price_pie: 11.99, inventory: 10)
    cat.items.create!(title: "item#{nums += 1}", description: "item2 description", price_pie: 12.99, inventory: 12)
    cat.items.create!(title: "item#{nums += 1}", description: "item3 description", price_pie: 13.99, inventory: 15)
    cat.items.create!(title: "item#{nums += 1}", description: "item4 description", price_pie: 14.99, inventory: 3)
    cat.items.create!(title: "item#{nums += 1}", description: "item5 description", price_pie: 15.99, inventory: 4)
  end
end

# ------------------ Grandma's Pies and Turing's Pies - 2 Custom Stores -------------------------------

restaurant1 = Restaurant.create(name: "Grandma's Pies", slug: "grandma-s-pies")
restaurant2 = Restaurant.create(name: "Turing's Pies", slug: "turing-s-pies")

category1 = restaurant1.categories.create(name: "Classics")
category2 = restaurant2.categories.create(name: "Savory")
category3 = restaurant1.categories.create(name: "So Good and So Unhealthy")
category4 = restaurant2.categories.create(name: "I Can't Believe It's Good For Me")
category5 = restaurant1.categories.create(name: "You Put That In A Pie?")

category6 = restaurant2.categories.create(name: "Classics")
category7 = restaurant1.categories.create(name: "Savory")
category8 = restaurant2.categories.create(name: "So Good and So Unhealthy")
category9 = restaurant1.categories.create(name: "I Can't Believe It's Good For Me")
category10 = restaurant2.categories.create(name: "You Put That In A Pie?")

category1.items.create(title: "Awesome Apple", description: "Local, organically grown apples, gluten-free",
                       inventory: 10, price_pie: 12.99, category_ids: [1, 4])
category1.items.create(title: "Key-Lime", description: "Local, organically grown limes, gluten-free",
                       inventory:12, price_pie: 17.99, category_ids:[1, 4])
category1.items.create(title: "Peach", description: "Local farm-fresh peaches, homemade whipcream",
                       inventory:3, price_pie: 23.99, category_ids:[1, 3])
category1.items.create(title: "Banana", description: "Imported bananas, homemade filling",
                       inventory:5, price_pie: 23.99, category_ids:[1, 3])
category1.items.create(title: "Berry", description: "Three berry blend, of in-season, local berries",
                       inventory: 4, price_pie: 29.99, category_ids: [1])
category2.items.create(title: "Steak Mushroom", description: "Grass-fed cows, tender steak, mushrooms, onions, special sauce",
                       inventory: 5, price_pie: 35.99, category_ids:[2, 3])
category2.items.create(title: "Chicken Pie", description: "Free-range chicken, vegies, and a tangy sauce",
                       inventory: 10, price_pie: 33.99, category_ids: [2, 3])
category3.items.create(title: "Steak Chilli", description: "Grass-fed cows, tender steak, kidney beans, gluten-free",
                       inventory: 10, price_pie: 33.99, category_ids:[2, 1])
category3.items.create(title: "Sausage Tomato Fennel", description: "Italian sausage, spices, pepper, tomatos",
                       inventory: 12, price_pie: 31.15, category_ids:[2, 3])
category3.items.create(title: "Meat Lovers", description: "It's a heart-attack, for the serious meat-lover",
                       inventory: 12, price_pie: 36.99, category_ids:[2, 5])
category4.items.create(title: "Polka Pie", description: "Keilbasa, sauerkraut, cheese, potatoes",
                       inventory: 15, price_pie: 30.99, category_ids: [3])
category4.items.create(title: "Five Cheese", description: "Sharp-Cheddar, pepper-jack, blue-cheese, gruyere, gouda",
                       inventory: 15, price_pie: 30.99, category_ids:[3, 5])
category4.items.create(title: "Double Chocolate", description: "Cream filled goo with chocolate chips, chocalate mousse",
                       inventory: 5, price_pie: 30.99, category_ids:[3, 5])
category5.items.create(title: "Coconut Cream", description: "Rich coconut cream filling, gluten-free cookie crust",
                       inventory: 12, price_pie: 30.99, category_ids:[3, 1])
category5.items.create(title: "Turtle Pie", description: "Dark chocolate cream filling, pecans, carmel drizzle",
                       inventory: 12, price_pie: 30.99, category_ids:[3])
category5.items.create(title: "Vegan Chili", description: "Brown rice, vegies, rich tomato sauce",
                       inventory: 15, price_pie: 30.99, category_ids: [4])
category6.items.create(title: "Ratatouille", description: "Winter vegetables, stewed in zesty tomato sauce, vegan",
                       inventory: 15, price_pie: 30.99, category_ids:[4])
category6.items.create(title: "Roasted Veggie", description: "Mushrooms, onions, peppers, broccoli, potatoes",
                       inventory: 12, price_pie: 30.99, category_ids:[4])
category7.items.create(title: "No Sugar Added Peach Pie", description: "Tons of peaches without added sugar",
                       inventory: 12, price_pie: 30.99, category_ids:[4, 1])
category7.items.create(title: "No Sugar Added Lemon Pie", description: "Face wrinkling lemons, for the serious lemon lover",
                       inventory: 12, price_pie: 30.99, category_ids:[4, 5])
category8.items.create(title: "Breakfast Pie", description: "6 eggs, hashbrowns, pancakes, and bacon",
                       inventory: 15, price_pie: 30.99, category_ids: [5])
category8.items.create(title: "Lemon Chess", description: "Lemon zest, lemon juice, eggs, cornmeal, sugar crust",
                       inventory: 15, price_pie: 30.99, category_ids:[5])
category9.items.create(title: "Lunch Pie", description: "Free-range chicken, tomatoes, pickles, cheese",
                       inventory: 12, price_pie: 30.99, category_ids:[5])
category9.items.create(title: "Baltimore Bomb", description: "Berger Cookies, vanilla chess filling",
                       inventory: 12, price_pie: 30.99, category_ids:[5])
category10.items.create(title: "Elvis Pie", description: "Peanut butter, bacon, bananas, and chocolate",
                        inventory: 12, price_pie: 30.99, category_ids:[5])

Order.create(user_id: 1, order_total: 15, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 1, order_total: 16, order_type: "delivery", delivery_address: "1520 Blake Street, Denver, CO", order_status: "cancelled")
Order.create(user_id: 2, order_total: 17, order_type: "pick-up", delivery_address: nil, order_status: "ordered")
Order.create(user_id: 3, order_total: 35, order_type: "pick-up", delivery_address: nil, order_status: "ordered", restaurant_id: 2)
Order.create(user_id: 4, order_total: 45, order_type: "pick-up", delivery_address: nil, order_status: "cancelled")
Order.create(user_id: 4, order_total: 34, order_type: "delivery", delivery_address: "1510 Blake Street, Denver, CO", order_status: "completed")
Order.create(user_id: 3, order_total: 78, order_type: "pick-up", delivery_address: nil, order_status: "completed", restaurant_id: 5)
Order.create(user_id: 2, order_total: 88, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 4, order_total: 34, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 3, order_total: 12, order_type: "pick-up", delivery_address: nil, order_status: "completed", restaurant_id: 1)

OrderItem.create(order_id: 1, item_id: 2)
OrderItem.create(order_id: 2, item_id: 4)
OrderItem.create(order_id: 3, item_id: 5)
OrderItem.create(order_id: 4, item_id: 6)
OrderItem.create(order_id: 5, item_id: 7)
OrderItem.create(order_id: 6, item_id: 8)
OrderItem.create(order_id: 7, item_id: 9)
OrderItem.create(order_id: 8, item_id: 10)
OrderItem.create(order_id: 9, item_id: 11)
OrderItem.create(order_id: 10, item_id: 12)

admin = Role.create(name: 'admin')
customer = Role.create(name: 'customer')

User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", display_name: nil, role_ids: [customer.id])
User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", display_name: "j3", role_ids: [customer.id])
User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", display_name: "novohispano", role_ids: [customer.id])
User.create(full_name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", password: "password", display_name: "josh", role_ids: [admin.id])
