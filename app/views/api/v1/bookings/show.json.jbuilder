json.bookings do
  json.id @booking.id
  json.time @booking.time
  json.status @booking.status
  json.service_id @booking.service_id
  json.date @booking.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
