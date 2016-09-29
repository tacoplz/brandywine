class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

  #the following code is used to provide and validate an attachment, this code
  #relys on the paperclip gem
   has_attached_file :user_image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "300x300>" }
   validates_attachment :user_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
   validates_attachment_file_name :user_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end

end
