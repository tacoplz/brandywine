json.array!(@furniture_types) do |furniture_type|
  json.extract! furniture_type, :id, :furniture_room, :furniture_class
  json.url furniture_type_url(furniture_type, format: :json)
end
