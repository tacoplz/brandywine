class AboutU < ActiveRecord::Base

  has_attached_file :about_us_image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "300x300>" }
  validates_attachment :about_us_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :about_us_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]

end
