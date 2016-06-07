class FurnitureRoom < ActiveRecord::Base

  def self.roomtypes
    FurnitureRoom.all.map { |room| room.room_type}
  end

end
