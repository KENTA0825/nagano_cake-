# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "1@1",
    password: "111111"
)

Item.create!(
    name: "いちごのショートケーキ（ホール）",
    introduction: "栃木県産のとちおとめを贅沢に使用しています",
    price: 2750,
    is_active: true
    
    )