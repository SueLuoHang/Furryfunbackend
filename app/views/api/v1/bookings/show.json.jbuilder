json.bookings do
  json.id @booking.id
  json.time @booking.time
  json.status @booking.status
  json.pet @booking.pet.pet_name
  json.date @booking.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
