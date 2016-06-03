json.array!(@furniture_rooms) do |furniture_room|
  json.extract! furniture_room, :id, :room_type
  json.url furniture_room_url(furniture_room, format: :json)
end
