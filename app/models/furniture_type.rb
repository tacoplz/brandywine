class FurnitureType < ActiveRecord::Base

belongs_to :furniture_room, foreign_key: 'furniture_room_id'

#probably a problem in this method because im defining FurnitureType.roomtypes to actually be list of FurnitureRoom.room_type
  def self.furnituretypes
    FurnitureType.all.map { |type| type.furniture_class}
  end

  def self.roomtypes
      FurnitureRoom.all.map { |room| [ room.room_type, room.room_type, {"data-roomid" => room.id} ] }
  end

end
