class FurnitureType < ActiveRecord::Base

  belongs_to :furniture_room, foreign_key: 'furniture_room_id'

  validates :furniture_class,  presence: true, format: { with: /\A[\s\w]*\z/ }, length: { maximum: 50 }
  validates :furniture_room_for_class,  presence: true, format: { with: /\A[\s\w]*\z/ }, length: { maximum: 50 }
  validates :furniture_room_id,  presence: true, format: { with: /\A[\d]*\z/ }, length: { maximum: 5 }

  #the following code is used to provide and validate an attachment, this code
  #relys on the paperclip gem
  has_attached_file :furniture_type_image, styles: { small: "150x150#" }
  validates_attachment :furniture_type_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_attachment_file_name :furniture_type_image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_with AttachmentSizeValidator, attributes: :furniture_type_image, less_than: 200.kilobytes

  #probably a problem in this method because im defining FurnitureType.roomtypes to actually be list of FurnitureRoom.room_type
  def self.furnituretypes
    FurnitureType.all.map { |type| type.furniture_class}
  end

  def self.roomtypes
      FurnitureRoom.all.map { |room| [ room.room_type, room.room_type, {"data-roomid" => room.id} ] }
  end

end
