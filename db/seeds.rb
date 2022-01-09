# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Booking.destroy_all
Service.destroy_all
Pet.destroy_all
User.destroy_all

puts "all records destroy"

user = User.create(
  user_name: "Sue_sue",
  phone_number: "1951",
)
puts "user 1 has been created"

pets = [
  {
    pet_name: 'Momo',
    pet_type: 'dog',
    location: 'Shanghai',
    gender: 'male',
    title: 'Many years of professional modelling experience',
    description: 'Momo is a six year old Golden Retriever who has been modelling since he was one year old and he has been in many commercials and promos.',
    file: 'https://furryfun.oss-cn-shanghai.aliyuncs.com/Golden-retriever.jpg?Expires=1641474208&OSSAccessKeyId=TMP.3KeEv95ZMZYhpa8HVCjfb3YFbpMC2jedfJFsZnnpe19aWYiLg2HLUHJrgsaJLVoALG18tBJSZPPr5BXrvJhEcNf7rHhmBx&Signature=taXwWB11uPXDiJgfIRGGOeLk%2BIQ%3D&versionId=CAEQLBiBgIDJ8OW68RciIDc5MGYxNTg0NWQ5NTRiMjU5ZjRhZTIwNmJkMzAyYjA4&response-content-type=application%2Foctet-stream'
  }, {
    pet_name: 'Kimi',
    pet_type: 'dog',
    location: 'Xi`an',
    gender: 'female',
    title: 'Popular on Red',
    description: 'Kimi is an eight-year-old Chinese rural dog who travels a lot with his owner and has many followers on social media, Red.',
    file: 'https://furryfun.oss-cn-shanghai.aliyuncs.com/Chinese-rural-dog.jpg?Expires=1641474233&OSSAccessKeyId=TMP.3KeEv95ZMZYhpa8HVCjfb3YFbpMC2jedfJFsZnnpe19aWYiLg2HLUHJrgsaJLVoALG18tBJSZPPr5BXrvJhEcNf7rHhmBx&Signature=CMR6DOKptN9bWYJ6PJvJbLzORuQ%3D&versionId=CAEQLBiBgIDe8OW68RciIDFhYTk1MWE1MGUyMTQyYzViOTllNTc5OTI1MzBmNjg1&response-content-type=application%2Foctet-stream'
  }, {
    pet_name: 'Feizai',
    pet_type: 'cat',
    location: 'Beijing',
    gender: 'female',
    title: 'Enjoying the spotlight',
    description: 'feizai is a 3 year old British Shorthair who loves having his picture taken and enjoying the spotlight.',
    file: 'https://furryfun.oss-cn-shanghai.aliyuncs.com/British-shorthair.jpg?Expires=1641474258&OSSAccessKeyId=TMP.3KeEv95ZMZYhpa8HVCjfb3YFbpMC2jedfJFsZnnpe19aWYiLg2HLUHJrgsaJLVoALG18tBJSZPPr5BXrvJhEcNf7rHhmBx&Signature=7NmYQ9wr%2BOW7SXAlqAfGbx9dBYg%3D&versionId=CAEQLBiBgICR8OW68RciIDhhMWJkNmJjOTAyMDQyYzJhZTg3MWUxZGEyMTZjYjll&response-content-type=application%2Foctet-stream'
  },
  {
    pet_name: 'Gungun',
    pet_type: 'others',
    location: 'Chengdu',
    gender: 'female',
    title: 'Charity video experience',
    description: 'Gungun is a one-and-a-half year old alpaca who was featured in a charity video',
    file: 'https://furryfun.oss-cn-shanghai.aliyuncs.com/Alpaca.jpg?Expires=1641474274&OSSAccessKeyId=TMP.3KeEv95ZMZYhpa8HVCjfb3YFbpMC2jedfJFsZnnpe19aWYiLg2HLUHJrgsaJLVoALG18tBJSZPPr5BXrvJhEcNf7rHhmBx&Signature=mSYyT5EWtv2goqkFC%2F0CY%2FJWq9A%3D&versionId=CAEQLBiBgMDV8uW68RciIGZmMjg2NzJiNmMyYzRhODM5YzkzYTM3ZmJlZjdlZTkw&response-content-type=application%2Foctet-stream'
  }
]

pets.each do |pet, index|
  file = URI.open(pet[:file])
  pet = Pet.new(pet_name: pet[:pet_name], pet_type: pet[:pet_type], location: pet[:location], title: pet[:title], description: pet[:description], gender: pet[:gender], user: user)
  puts "============================================"

  pet.photo.attach(io: file, filename: "pet-#{index}.png", content_type: 'image/png')
  pet.save!
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
