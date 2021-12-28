json.bookings do
  json.(@bookings, :id, :status, :time)
end
