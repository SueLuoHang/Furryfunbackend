json.bookings do
  # json.array! @modelling_services, :name, :title, :description, :category
  json.array! @bookings, :id, :time, :status, :user_id, :pet_id
end
