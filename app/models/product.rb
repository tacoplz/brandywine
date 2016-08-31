class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

 #the following code is used to provide and validate an attachment, this code
 #relys on the paperclip gem
  has_attached_file :image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "300x300>" }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]

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
