class FurnitureRoom < ActiveRecord::Base

has_many :furniture_types

  def self.roomtypes
    #this method maps the data in the furniture_rooms db table and adds the custom html field data-roomid
    #this custom room type is used within the html selector to filter the subsequent selector for room_type
    FurnitureRoom.all.map { |room| [ room.room_type, room.room_type, {"data-roomid"=>room.id} ] }
  end

  def self.furnroomid
    FurnitureRoom.all.map { |room| [room.room_type, room.id]}
  end

end
