class Blog < ActiveRecord::Base
  has_attached_file :blog_image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "600x600" }
  validates_attachment :blog_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :blog_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
