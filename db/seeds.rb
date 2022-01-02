# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Service.destroy_all
Pet.destroy_all
User.destroy_all
puts "all records destroy"

user = User.create(
  user_name: "Sue_sue",
  phone_number: "1951",
  email: "robinlsh0809@gmail.com",
  password: "1234567"
)
puts "user 1 has been created"

pets = [
  {
    pet_name: 'Momo',
    pet_type: 'dog',
    location: 'Shanghai',
    gender: 'male',
    title: 'Many years of professional modelling experience',
    description: 'Momo is a six year old Golden Retriever who has been modelling since he was one year old and he has been in many commercials and promos.'
  }, {
    pet_name: 'Kimi',
    pet_type: 'dog',
    location: 'Xi`an',
    gender: 'female',
    title: 'Popular on Red',
    description: 'Kimi is an eight-year-old Chinese rural dog who travels a lot with his owner and has many followers on social media, Red.'
  }, {
    pet_name: 'Feizai',
    pet_type: 'cat',
    location: 'Beijing',
    gender: 'female',
    title: 'Enjoying the spotlight',
    description: 'feizai is a 3 year old British Shorthair who loves having his picture taken and enjoying the spotlight.'
  },
  {
    pet_name: 'Gungun',
    pet_type: 'others',
    location: 'Chengdu',
    gender: 'female',
    title: 'Charity video experience',
    description: 'Gungun is a one-and-a-half year old alpaca who was featured in a charity video'
  }
]

pets.each do |pet|
  Pet.create!(pet_name: pet[:pet_name], pet_type: pet[:pet_type], location: pet[:location], title: pet[:title], description: pet[:description], gender: pet[:gender], user: user)
  puts "pet created"
end
puts "Created #{Pet.count} pets information"

modelling_services = [
  {
    category: 'modelling'
  }, {
    category: 'modelling'
  }, {
    category: 'modelling'
  }, {
    category: 'modelling'
  }
]

modelling_services.each do |modelling_service|
  puts "begin to seed service"
  Service.create(category: modelling_service[:category], pet: Pet.first)
  puts "service created"
end
puts "Created #{Service.count} modelling services"

bookings = [
  {
    time: "2021-01-08",
    status: "completed"
  }, {
    time: "2022-12-31",
    status: "completed"
  }, {
    time: "2021-08-09",
    status: "completed"
  }, {
    time: "2023-01-01",
    status: "completed"
  }
]

bookings.each do |booking|
  Booking.create!(time: booking[:time], status: booking[:status], user: user, pet: Pet.first)
  puts "booking created"
end
puts "Created #{Booking.count} booking information"
