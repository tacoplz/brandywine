class FurnitureStyle < ActiveRecord::Base
  #the following code is used to provide and validate an attachment, this code
  #relys on the paperclip gem
  validates :furniture_style,  presence: true, format: { with: /\A[\s\w&%()]*\z/ }, length: { maximum: 50 }

  has_attached_file :furniture_style_image, styles: { small: "150x150>" }
  validates_attachment :furniture_style_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :furniture_style_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_with AttachmentSizeValidator, attributes: :furniture_style_image, less_than: 200.kilobytes, :unless => Proc.new {|m| m[:furniture_style_image].nil?}

  def self.furniturestyles
    FurnitureStyle.all.map { |furniture| [furniture.furniture_style]}
  end
end
