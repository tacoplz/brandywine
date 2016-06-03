json.array!(@furniture_woods) do |furniture_wood|
  json.extract! furniture_wood, :id, :wood_type
  json.url furniture_wood_url(furniture_wood, format: :json)
end
