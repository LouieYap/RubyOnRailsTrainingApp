json.extract! register, :id, :firstname, :lastname, :middlename, :age, :username, :country, :state, :created_at, :updated_at
json.url register_url(register, format: :json)
