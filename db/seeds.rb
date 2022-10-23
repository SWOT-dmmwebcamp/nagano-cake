# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.create!(email:  "1111@1111", password: "222222")

#Customer.create!(last_name: '醍醐', first_name: '芽衣',kana_first_name: 'メイ',kana_last_name: 'ダイゴ', zipcode: '1810091',
#address: '東京都○○区○○市', phone_number: '1112223333', email: 'meidaigodds@gmail.com', password: '111111111', delete_flag: true)

5.times do |n|
Order.create!(created_at: '2022/10/22', delivery_zip: '012-3456', delivery_address: '東京都港区すみたい市', delivery_name: '私田',
delivery_fee: 800, pay_type: 0, total_price: '110800', order_status: 1, customer_id: 1
)
end