json.pets do
  json.id @pet.id
  json.user_id @pet.user_id
  json.pet_type @pet.pet_type
  json.pet_name @pet.pet_name
  json.location @pet.location
  json.title @pet.title
  json.description @pet.description
  json.gender @pet.gender
  json.date @pet.created_at.strftime("%A, %d %b %Y %l:%M %p")
  json.url @pet.photo.service_url
end
