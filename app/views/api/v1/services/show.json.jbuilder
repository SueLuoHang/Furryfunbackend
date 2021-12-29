json.modelling_services do
  json.id @service.id
  json.title @service.title
  json.categoy @service.category
  json.pet_type @service.pet_type
  json.date @service.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
