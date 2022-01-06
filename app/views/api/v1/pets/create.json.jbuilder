json.pets do
  json.(@pets, :id, :pet_type, :pet_name, :location, :title, :description, :gender, :photo)
end
