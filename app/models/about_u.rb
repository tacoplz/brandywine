class AboutU < ActiveRecord::Base

  validates :phone_number, numericality: { only_integer: true, message: "must be entered without punctuation or spaces" },
    length: { is: 10, message: "must be a 10-digit number" }, presence: true
  validates :body,  presence: true, format: { with: /\A[\s\w+,.-:;&$%()#?!~="']*\z/ }, length: { maximum: 3000 }
  validates :email,  presence: true, format: { with: /.+\@.+\.[a-zA-Z]+/ }
  validates :address, presence: true, format: { with: /\A[\s\w+,.]*\z/ }, length: { maximum: 100 }
  validates :hours, presence: true, format: { with: /\A[\s\w:-]*\z/ }, length: { maximum: 200 }
    #{}/\w+.*\w+.*\W.*\w.*+\s\w+.*\w+.*\W.*\w.*+\s\w+.*\w+.*\W.*\w.*+\s\s\s\w+.*\W.*\w+/

  has_attached_file :about_us_image, styles: { large: "600x600", banner: "800x400#" }
  validates_attachment :about_us_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :about_us_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_with AttachmentSizeValidator, attributes: :about_us_image, less_than: 400.kilobytes, :unless => Proc.new {|m| m[:about_us_image].nil?}

end
