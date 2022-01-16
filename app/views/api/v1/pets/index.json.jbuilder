json.pets do
  json.array! @pets do |pet|
    json.extract! pet, :id, :pet_name, :pet_type, :location, :title, :description, :gender
    if pet.photo.attached?
      json.url pet.photo.service_url
    end
  end
end
