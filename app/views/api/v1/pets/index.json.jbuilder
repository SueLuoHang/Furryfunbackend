json.pets do
  # json.array! @modelling_services, :name, :title, :description, :category
  json.array! @pets, :id, :pet_name, :location, :description, :gender, :photos
end
