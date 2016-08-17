class Product < ActiveRecord::Base
 #the following code is used to provide and validate an attachment, this code
 #relys on the paperclip gem
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
