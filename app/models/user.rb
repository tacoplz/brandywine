class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Please only use letters in first name" }, length: { minimum: 2 }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Please only use letters in last name" }, length: { minimum: 2 }
  validates :referral, length: { maximum: 50,
    too_long: "%{count} characters is the maximum allowed" }
  validates :user_review, length: { maximum: 200,
    too_long: "%{count} characters is the maximum allowed" }
  validates :phone_number, numericality: { only_integer: true, message: "- please only enter a number without punctuation or spaces" },
    length: { is: 10, message: "- please enter a 10-digit number" }, allow_blank: true
  validates :email,  format: { with: /.+\@.+\.[a-zA-Z]+/ }
  validates :address, format: { with: /\w+/ }, length: { maximum: 100 }
  validates :apt_number, format: { with: /\w+/ }, length: { maximum: 8 }, allow_blank: true
  validates :city, format: { with: /[a-zA-Z]+/ }, length: { maximum: 20 }
  validates :state, format: { with: /[a-zA-Z]+/ }, length: { maximum: 20 }
  validates :zip_code, format: { with: /\d+/ }, length: { is: 5 }
  validates :password, format: { with: /\A.*(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@#$%^&+=]).*\z/, message: "- please ensure password contains at least one letter (a - z), number (0 - 9), and symbol (@ # $ % ^ & + =)"}, length: {within: 6..20} # the regex uses look ahead assertions 
  #validate password makes sure the password has at least 1 alpabetical character, 1 number, and one special symbol.

  #relationship between Role model and Users via foreign_key role_id
  belongs_to :roles, foreign_key: 'role_id'
  has_one :cart, dependent: :destroy
  has_secure_password

  #the following code is used to provide and validate an attachment, this code
  #relys on the paperclip gem
   has_attached_file :user_image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "300x300>" }
   validates_attachment :user_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
   validates_attachment_file_name :user_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.where(:role_name => "Admin").count.zero?
        raise "Can't delete last Admin User"
      end
    end

end
