json.extract! contestant, :id, :name, :email, :created_at, :updated_at
json.url contestant_url(contestant, format: :json)
