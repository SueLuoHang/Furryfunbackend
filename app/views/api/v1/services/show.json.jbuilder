json.service do
  json.id @service.id
  json.title @service.title
  json.description @service.description
  json.category @service.category
  json.date @service.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
