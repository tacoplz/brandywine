class Blog < ActiveRecord::Base
  validates :title,  presence: true, format: { with: /\A[\s\w+,.-:;$%()#?!~="']*\z/ }, length: { maximum: 55 }
  validates :blog_post,  presence: true, format: { with: /\A[\s\w+,.-:;$%()#?!~="']*\z/ }, length: { maximum: 3000 }

  has_attached_file :blog_image, styles: { thumb: "100x100#", small: "150x150#", large: "600x600#" }
  validates_attachment :blog_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :blog_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
    validates_with AttachmentSizeValidator, attributes: :blog_image, less_than: 400.kilobytes, :unless => Proc.new {|m| m[:blog_image].nil?}
end
