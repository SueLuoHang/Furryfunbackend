json.booking do
  json.user_id @booking.user_id
  json.service_id @booking.service_id
  json.status @booking.status
  json.date @booking.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
