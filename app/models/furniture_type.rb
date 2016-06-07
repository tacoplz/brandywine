class FurnitureType < ActiveRecord::Base

  def self.roomtypes
    FurnitureRoom.all.map {|room| room.room_type}
  end

  def self.furnituretypes
    FurnitureType.all.map { |type| type.furniture_class}
  end

end
