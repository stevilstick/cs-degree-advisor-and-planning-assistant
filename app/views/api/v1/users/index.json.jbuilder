json.users @users do |user|
  json.id               user.id
  json.created_at       user.created_at
  json.first_name       user.first_name
  json.last_name        user.last_name
  json.email            user.email
end
