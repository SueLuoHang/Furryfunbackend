json.modelling_services do
  # json.array! @modelling_services, :name, :title, :description, :category
  json.array! @services, :id, :title, :category, :pet_type
end
