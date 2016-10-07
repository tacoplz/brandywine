class FurnitureStyle < ActiveRecord::Base
  #the following code is used to provide and validate an attachment, this code
  #relys on the paperclip gem
   has_attached_file :furniture_style_image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "300x300>" }
   validates_attachment :furniture_style_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
   validates_attachment_file_name :furniture_style_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]

   def self.furniturestyles
    FurnitureStyle.all.map { |furniture| [furniture.furniture_style]}
   end
end
