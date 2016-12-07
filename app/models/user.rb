class User < ActiveRecord::Base
  #the following code is used to activate user tokens to verify a users email when created, may not need a few of these methods
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest


  #validation for user data
  validates :name, presence: true, uniqueness: {message: 'Username already taken'}, length: { minimum: 3, message: "Username too short, minimum 3 characters" }
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Please only use letters in first name" }, length: { minimum: 2 }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Please only use letters in last name" }, length: { minimum: 2 }
  validates :referral, length: { maximum: 50,
    too_long: "%{count} characters is the maximum allowed" }, allow_blank: true
  validates :user_review, length: { maximum: 200,
    too_long: "%{count} characters is the maximum allowed" }, allow_blank: true
  validates :phone_number, numericality: { only_integer: true, message: "must be entered without punctuation or spaces" },
    length: { is: 10, message: "must be a 10-digit number" }, allow_blank: true
  validates :email,  presence: true, format: { with: /.+\@.+\.[a-zA-Z]+/ }, uniqueness: { message: "has already been used to create an account"}
  validates :address, format: { with: /\w+/ }, length: { maximum: 100 }, allow_blank: true
  validates :apt_number, format: { with: /\w+/ }, length: { maximum: 8 }, allow_blank: true
  validates :city, format: { with: /[a-zA-Z]+/ }, length: { maximum: 20 }, allow_blank: true
  validates :state, format: { with: /[a-zA-Z]+/ }, length: { maximum: 20 }, allow_blank: true
  validates :zip_code, format: { with: /\d+/ }, length: { is: 5 }, allow_blank: true
  #validate password makes sure the password has at least 1 alpabetical character, 1 number, and one special symbol.
  validates :password, format: { with: /\A.*(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@#$%^&+=]).*\z/, message: "must contain at least one letter (a - z), number (0 - 9), and symbol (@ # $ % ^ & + =)"}, length: {within: 6..20, message: "too short, minimum 6 characters"}, on: :update, allow_blank: true# the regex uses look ahead assertions
  # validates password_confirmation does not require the presence of a password to prevent the password errors from displaying twice. Confirmation must still match password before user is created
  validates :password_confirmation, presence: false

  #relationship between Role model and Users via foreign_key role_id
  belongs_to :roles, foreign_key: 'role_id'
  has_one :cart, dependent: :destroy
  has_secure_password

  #the following code is used to provide and validate an attachment, this code
  #relys on the paperclip gem
   has_attached_file :user_image, styles: { thumb: "100x100#", small: "150x150#" }, :default_url => "missing_profile_pic.png"
   validates_attachment :user_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
   validates_attachment_file_name :user_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
   validates_with AttachmentSizeValidator, attributes: :user_image, less_than: 200.kilobytes, :unless => Proc.new {|m| m[:user_image].nil?}

   after_destroy :ensure_an_admin_remains

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #returns a random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions. NOT CURRENTLY USING
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  #Sets the password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  #Sends password reset email
  def send_password_reset_email
    UserNotifier.lost_password(self).deliver_now
  end
  #Remove User Review
  #def self.destroy_user_review(user_id)
  #  User.find(user_id).update_attribute(:user_review, '')
  #end
  # returns true if password reset has expired
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  # Converts user entered recovery email to all lower-case.
  def downcase_email
    unless self.email == nil
      self.email = email.downcase
    end
  end



    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

    def ensure_an_admin_remains
      if User.where(:role_name => "Admin").count.zero?
        raise "Can't delete last Admin User"
      end
    end

end
