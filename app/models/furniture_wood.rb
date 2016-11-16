class FurnitureWood < ActiveRecord::Base

  validates :wood_type,  presence: true, format: { with: /\A[\s\w&-'()]*\z/ }, length: { maximum: 50 }

  def self.woodtypes
   FurnitureWood.all.map { |wood| [ wood.wood_type]}
  end

end
