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

modelling_services = [
  {
    name: "Momo",
    title: 'Many years of professional modelling experience',
    description: 'Momo is a six year old Golden Retriever who has been modelling since he was one year old and he has been in many commercials and promos.',
    category: 'modelling'
  }, {
    name: 'Kimi',
    title: 'Popular on Red',
    description: 'Kimi is an eight-year-old Chinese rural dog who travels a lot with his owner and has many followers on social media, Red.',
    category: 'modelling'
  }, {
    name: 'Feizai',
    title: 'Enjoying the spotlight',
    description: 'feizai is a 3 year old British Shorthair who loves having his picture taken and enjoying the spotlight.',
    category: 'modelling'
  },
  {
    name: 'Gungun',
    title: 'Charity video experience',
    description: 'Gungun is a one-and-a-half year old alpaca who was featured in a charity video.',
    category: 'modelling'
  }
]


modelling_services.each do |modelling_service|
  ms = Service.create!(name: modelling_service[:name], title: modelling_service[:title], description: modelling_service[:description], category: modelling_service[:category], user: user)
  puts "model #{ms.name} created"
end
puts "Created #{Service.count} modelling services"
