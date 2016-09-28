class FurnitureRoom < ActiveRecord::Base

has_many :furniture_types, :dependent => :destroy

#the following code is used to provide and validate an attachment, this code
#relys on the paperclip gem
 has_attached_file :room_image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "300x300>" }
 validates_attachment :room_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
 validates_attachment_file_name :room_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]

  def self.roomtypes
    #this method maps the data in the furniture_rooms db table and adds the custom html field data-roomid
    #this custom room type is used within the html selector to filter the subsequent selector for room_type
    FurnitureRoom.all.map { |room| [ room.room_type, room.room_type, {"data-roomid"=>room.id} ] }
  end

  def self.furnroomid
    FurnitureRoom.all.map { |room| [room.room_type, room.id]}
  end

  #def self.room_query
  #  FurnitureRoom.all.map { |room| [room.id, room.room_type]}
  #end
end
