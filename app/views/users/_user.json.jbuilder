json.extract! user, :id, :name, :image_url, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
