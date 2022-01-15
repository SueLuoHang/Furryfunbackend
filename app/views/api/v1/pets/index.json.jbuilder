json.pets do
  json.array! @pets do |pet|
    json.extract! pet, :id, :pet_name, :pet_type, :location, :title, :description, :gender
    json.url pet.photo.service_url
  end
end
