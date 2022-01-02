json.modelling_services do
  json.array! @services, :id, :category, :pet_id
end
