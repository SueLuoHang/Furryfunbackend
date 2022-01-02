json.modelling_services do
  json.id @service.id
  json.categoy @service.category
  json.pet_id @service.pet_id
  json.date @service.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
