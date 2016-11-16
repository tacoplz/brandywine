class FurnitureStain < ActiveRecord::Base

  validates :stain_type,  presence: true, format: { with: /\A[\s\w-]*\z/ }, length: { maximum: 50 }

end
