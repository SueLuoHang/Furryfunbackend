json.users do
  json.array! @users do |user|
    json.extract! user, :id, :user_name
  end
end

json.services do
  json.array! @services do |service|
    json.pet_id service.pet_id
  end
end
