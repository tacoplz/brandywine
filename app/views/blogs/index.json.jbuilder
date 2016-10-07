json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :blog_post, :blog_image
  json.url blog_url(blog, format: :json)
end
