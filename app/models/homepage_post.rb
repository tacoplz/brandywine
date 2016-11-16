class HomepagePost < ActiveRecord::Base

  validates :post_title,  presence: true, format: { with: /\A[\s\w+,.-:;$%&()#?!~="']*\z/ }, length: { maximum: 50 }
  validates :post_text,  presence: true, format: { with: /\A[\s\w+,.-:;$%&()#?!~="']*\z/ }, length: { maximum: 3000 }
  validates :post_img_url,  presence: true, format: { with: /\A[\s\w+,.-:;&$%()#?!~="']*\z/ }, length: { maximum: 100 }, allow_blank: true

end
