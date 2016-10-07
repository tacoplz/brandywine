json.array!(@furniture_styles) do |furniture_style|
  json.extract! furniture_style, :id, :furniture_style, :furniture_style_image
  json.url furniture_style_url(furniture_style, format: :json)
end
