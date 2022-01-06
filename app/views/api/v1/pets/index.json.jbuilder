json.pets do
  json.array! @pets, :id, :pet_name, :pet_type, :location, :title, :description, :gender, :photo
end

json.services do
  json.array! @services do |service|
    json.pet_id service.pet_id
  end
end
