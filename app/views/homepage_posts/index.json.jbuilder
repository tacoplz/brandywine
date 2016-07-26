json.array!(@homepage_posts) do |homepage_post|
  json.extract! homepage_post, :id, :post_title, :post_text, :post_img_url
  json.url homepage_post_url(homepage_post, format: :json)
end
