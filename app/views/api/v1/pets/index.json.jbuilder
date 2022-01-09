json.pets do
  json.array! @pets do |pet|
    json.extract! pet, :id, :pet_name, :pet_type, :location, :title, :description, :gender
    json.url pet.photo.service_url
  end
end

json.services do
  json.array! @services do |service|
    json.pet_id service.pet_id
  end
end
