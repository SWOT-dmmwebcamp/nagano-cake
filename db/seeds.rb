# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |num|
  Order.create!(
    customer_id: "1",
    delivery_zip: "1234567",
    delivery_address: "東京都XX区XX町 X-X-X",
    delivery_name: "user#{num}",
    delivery_fee: "800",
    total_price: "1000",
    pay_type: 0,
    order_status: 0
    )
  end