json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :image_url, :room_for_furniture, :furniture_type, :furniture_wood, :furniture_stain, :furniture_dimensions
  json.url product_url(product, format: :json)
end
