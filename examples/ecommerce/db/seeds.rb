require 'faker'

# NOTES:
#
# Incorrect Dates for Orders + Users
# ---
# We're creating orders that can be before the user was even created. Thats not right.
# We need to create users, accounts + users, at various time periods.
# We then need to create orders after that date and time.
#

puts 'Truncating database...'
ActiveRecord::Tasks::DatabaseTasks.truncate_all
puts 'Database truncated.'

puts 'Creating product availabilities...'
["Available", "Preorder", "Backordered", "Unavailable"].each do |availability|
  Availability.create(name: availability)
end
puts 'Product availabilities created.'

puts 'Creating suppliers...'
10.times do
  Supplier.create(name: Faker::Company.unique.name)
end
puts 'Suppliers created.'

puts 'Creating products...'
50.times do
  Product.create(name: Faker::Commerce.product_name, availability: Availability.all.sample, supplier: Supplier.all.sample)
end
puts 'Products created.'

puts 'Creating product price history...'
Product.all.each do |product|
  rand(1..25).times do
    ProductPriceHistory.create(product:, price: Faker::Commerce.price, active: [true, false].sample)
  end
end
puts 'Product price histories created...'

puts 'Creating roles...'
['Admin', 'Customer', 'Supplier Owner'].each do |role|
  Role.create(name: role)
end
puts 'Created roles.'

puts 'Creating accounts and users...'
5.times do
  account = Account.create(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password
  )

  user = User.create(username: Faker::Internet.unique.username)

  AccountMembership.create(account:, user:,role: Role.all.sample)
end
puts 'Accounts and users created.'

puts 'Creating supplier owners...'
role = Role.find_by_name("Supplier Owner")
3.times do
  account = Account.all.sample
  supplier = Supplier.all.sample

  SupplierMembership.create(account:, supplier:, role:)
end
puts 'Supplier owners created.'

puts 'Creating order statuses...'
statuses = { pending: 0, processing: 1, cancelled: 2, received: 3, approved: 4 }

statuses.each do |k, v|
  OrderStatus.create(name: k, code: v, description: Faker::Lorem.sentence)
end
puts 'Order statuses created.'

puts 'Creating orders + order status histories...'
users = User.all
1000.times do
  order = Order.create(user: users.sample, placed_at: Faker::Time.between(from: 6.months.ago, to: Time.current))
  histories = []

  last_order_status_history = nil
  rand(1..5).times do
    order_id = order.id
    order_status_id = OrderStatus.all.sample.id
    created_at = (last_order_status_history.present? ? last_order_status_history[:created_at] : order.placed_at) + 1.hour
    updated_at = (last_order_status_history.present? ? last_order_status_history[:updated_at] : order.placed_at) + 1.hour

    last_order_status_history = { order_id:, order_status_id:, created_at:, updated_at: }

    histories << last_order_status_history
  end

  OrderStatusHistory.insert_all(histories)
end
puts 'Orders and their status histories created.'

puts 'Creating order items...'
products = Product.all
Order.all.each do |order|
  rand(1..5).times.each do
    while true
      product = products.sample
      break if !order.order_items.exists?(product: product)
    end

    product_price_history = product.product_price_histories.order(created_at: :desc).limit(1).first

    OrderItem.create(
      order:,
      product:,
      quantity: rand(1..5),
      price: product_price_history.price
    )
  end
end
puts 'Order items created'
