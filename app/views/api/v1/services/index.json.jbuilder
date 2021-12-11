json.services do
  json.array! @services, :id, :title, :description, :category
end
