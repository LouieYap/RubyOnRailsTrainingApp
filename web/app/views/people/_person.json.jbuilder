json.extract! person, :id, :firstname, :lastname, :middlename, :age, :created_at, :updated_at
json.url person_url(person, format: :json)
