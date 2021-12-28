json.pets do
  json.(@pets, :id, :pet_name, :location, :description, :gender, :photos)
end
