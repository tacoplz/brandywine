class FurnitureType < ActiveRecord::Base

belongs_to :furniture_room, foreign_key: 'furniture_room_id'

#the following code is used to provide and validate an attachment, this code
#relys on the paperclip gem
 has_attached_file :furniture_type_image, styles: { thumb: "100x100>", small: "150x150#", medium: "200x200>", large: "300x300>" }
 validates_attachment :furniture_type_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
 validates_attachment_file_name :furniture_type_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]

#probably a problem in this method because im defining FurnitureType.roomtypes to actually be list of FurnitureRoom.room_type
  def self.furnituretypes
    FurnitureType.all.map { |type| type.furniture_class}
  end

  def self.roomtypes
      FurnitureRoom.all.map { |room| [ room.room_type, room.room_type, {"data-roomid" => room.id} ] }
  end

end
