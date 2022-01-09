json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :time
  end
end
