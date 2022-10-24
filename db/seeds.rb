# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email:  "1111@1111", password: "222222")

Customer.create!(last_name: '醍醐', first_name: '芽衣',kana_first_name: 'メイ',kana_last_name: 'ダイゴ', zipcode: '1810091',
address: '東京都○○区○○市', phone_number: '1112223333', email: 'meidaigodds@gmail.com', password: '111111111', delete_flag: true)

Genre.create!(name: 'ケーキ')

item = Item.create!(genre_id: 1, item_name: 'イチゴ', caption: 'すっぱい', price: 300, sales_status: 'true')
item.image.attach(io: File.open(Rails.root.join('app/assets/images/no_image.jpeg')),
                  filename: 'no_image.jpeg')

Order.create!(created_at: '2022/10/22', delivery_zip: '012-3456', delivery_address: '東京都港区すみたい市', delivery_name: '私田',
delivery_fee: 800, pay_type: 0, total_price: 1400, order_status: 1, customer_id: 1)

Orderdetail.create!(order_id: 1, item_id: 1, price_at_purchase: 300, piece: 2, item_status: 3)