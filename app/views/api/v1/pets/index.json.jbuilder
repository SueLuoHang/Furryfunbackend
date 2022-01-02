json.pets do
  json.array! @pets, :id, :pet_name, :location, :description, :gender, :photos
end

json.services do
  json.array! @services do |service|
    json.pet_type service.pet_type
    json.title service.title
  end
end
