class FurnitureType < ActiveRecord::Base

belongs_to :furniture_room #foriegn key funiture_room_id

  def self.roomtypes
    FurnitureRoom.all.map {|room| room.room_type}
  end

  def self.furnituretypes
    FurnitureType.all.map { |type| type.furniture_class}
  end

end
