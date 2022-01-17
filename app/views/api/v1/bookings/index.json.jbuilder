json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :time, :status, :user_id, :pet_id
    pet = booking.pet
    json.extract! pet, :pet_name, :title
    json.url pet.photo.service_url
  end
end
