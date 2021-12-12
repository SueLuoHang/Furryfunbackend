# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Service.destroy_all
User.destroy_all
user = User.create!(
  user_name: Faker::Name.name,
  phone_number: Faker::PhoneNumber.phone_number,
  email: "robinlsh0809@gmail.com",
  password: "1234567"
)

Service.create!(
  title: 'pets care',
  description: 'give you best care',
  category: 'daily_care',
  user: user
)
