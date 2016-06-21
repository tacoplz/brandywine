class FurnitureRoom < ActiveRecord::Base

has_many :furniture_types

  def self.roomtypes
    FurnitureRoom.all.map { |room| room.room_type}
  end

  def self.furnroomid
    FurnitureRoom.all.map { |room| [room.room_type, room.id]}
  end

end
