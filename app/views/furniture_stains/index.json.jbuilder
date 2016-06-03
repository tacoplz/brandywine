json.array!(@furniture_stains) do |furniture_stain|
  json.extract! furniture_stain, :id, :stain_type
  json.url furniture_stain_url(furniture_stain, format: :json)
end
