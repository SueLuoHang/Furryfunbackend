json.pets do
  json.id @pet.id
  json.user_id @pet.user_id
  json.pet_name @pet.pet_name
  json.location @pet.location
  json.description @pet.description
  json.gender @pet.gender
  json.photos @pet.photos
  json.date @pet.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
