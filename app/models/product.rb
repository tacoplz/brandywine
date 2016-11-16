class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title,  presence: true, format: { with: /\A[\s\w,.-:]*\z/ }, length: { maximum: 50 }
  validates :description,  presence: true, format: { with: /\A[\s\w+,.-:;$%&()#?!~="']*\z/ }, length: { maximum: 1000 }
  validates :room_for_furniture,  presence: true, format: { with: /\A[\s\w]*\z/ }, length: { maximum: 50 }
  validates :furniture_type,  presence: true, format: { with: /\A[\s\w]*\z/ }, length: { maximum: 50 }
  validates :furniture_wood,  presence: true, format: { with: /\A[\s\w]*\z/ }, length: { maximum: 50 }
  validates :furniture_stain,  presence: true, format: { with: /\A[\s\w-]*\z/ }, length: { maximum: 50 }
  validates :furniture_dimensions, format: { with: /\A[\s\w+,.-:;$%*&()]*\z/ }, length: { maximum: 100 }, allow_blank: true
  validates :furniture_style,  presence: true, format: { with: /\A[\s\w]*\z/ }, length: { maximum: 50 }

  #the following code is used to provide and validate an attachment, this code
  #relys on the paperclip gem
  has_attached_file :image, styles: { small: "150x150#", medium: "200x200>", large: "600x800>" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 2.megabytes, :unless => Proc.new {|m| m[:image].nil?}

  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
