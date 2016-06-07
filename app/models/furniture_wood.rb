class FurnitureWood < ActiveRecord::Base

  def self.woodtypes
   FurnitureWood.all.map { |wood| [ wood.wood_type]}
  end

end
