# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Sopheaktra Yong",
             email: "sopheaktra.yong@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

users = User.order(:created_at).take(6)
50.times do
  content = "Testing comments"
  users.each { |user| user.microposts.create!(content: content) }
end