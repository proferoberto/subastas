json.extract! user, :id, :name, :lastname, :age, :email, :about, :created_at, :updated_at
json.url user_url(user, format: :json)
