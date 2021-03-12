# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#悩みカテゴリー追加用

Category.create(name: "健康")
Category.create(name: "お金")
Category.create(name: "人間関係")
Category.create(name: "仕事")
Category.create(name: "容姿")
Category.create(name: "恋愛・結婚")
Category.create(name: "環境")
Category.create(name: "価値観")
Category.create(name: "将来")
Category.create(name: "その他")

#テストユーザー作成用

User.create(name: "user1", email: "user1@email", password: "kaikai")
User.create(name: "user2", email: "user2@email", password: "kaikai")
User.create(name: "user3", email: "user3@email", password: "kaikai")
User.create(name: "user4", email: "user4@email", password: "kaikai")