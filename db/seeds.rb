# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Service.destroy_all
Pet.destroy_all
User.destroy_all
Booking.destroy_all
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
    location: 'Shanghai',
    gender: 'male',
    description: 'Momo is a six year old Golden Retriever who has been modelling since he was one year old and he has been in many commercials and promos.'
  }, {
    pet_name: 'Kimi',
    location: 'Xi`an',
    gender: 'female',
    description: 'Kimi is an eight-year-old Chinese rural dog who travels a lot with his owner and has many followers on social media, Red.'
  }, {
    pet_name: 'Feizai',
    location: 'Beijing',
    gender: 'female',
    description: 'feizai is a 3 year old British Shorthair who loves having his picture taken and enjoying the spotlight.'
  },
  {
    pet_name: 'Gungun',
    location: 'Chengdu',
    gender: 'female',
    description: 'Gungun is a one-and-a-half year old alpaca who was featured in a charity video'
  }
]

pets.each do |pet|
  Pet.create!(pet_name: pet[:pet_name], location: pet[:location], description: pet[:description], gender: pet[:gender], user: user)
  puts "pet created"
end
puts "Created #{Pet.count} pets information"

modelling_services = [
  {
    title: 'Many years of professional modelling experience',
    category: 'modelling',
    pet_type: 'cat'
  }, {
    title: 'Popular on Red',
    category: 'modelling',
    pet_type: 'dog'
  }, {
    title: 'Enjoying the spotlight',
    category: 'modelling',
    pet_type: 'others'
  },
  {
    title: 'Charity video experience',
    category: 'modelling',
    pet_type: 'cat'
  }
]


modelling_services.each do |modelling_service|
  puts "begin to seed service"
  ms = Service.create(title: modelling_service[:title], pet_type: modelling_service[:pet_type], category: modelling_service[:category], pet: Pet.first)
  puts "service #{ms.title} created"
end
puts "Created #{Service.count} modelling services"

bookings = [
  {
    time: "2021-01-08",
    status: "completed"
  },{
    time: "2022-12-31",
    status: "completed"
  },{
    time: "2021-08-09",
    status: "completed"
  },{
    time: "2023-01-01",
    status: "completed"
  }
]

bookings.each do |booking|
  Booking.create!(time: booking[:time], status: booking[:status], user: user, service: Service.first)
  puts "booking created"
end
puts "Created #{Booking.count} booking information"
