json.modelling_services do
  # json.array! @modelling_services, :name, :title, :description, :category
  json.array! @services, :id, :name, :title, :description, :category, :photos
end
