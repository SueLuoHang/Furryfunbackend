json.user do
  json.id @user.id
  json.user_name @user.user_user
  json.phone_number @user.phone_number
  json.date @user.created_at.strftime("%A, %d %b %Y %l:%M %p")
end
