class CreateFurnitureRooms < ActiveRecord::Migration
  def change
    create_table :furniture_rooms do |t|
      t.string :room_type
      #add image for use with paperclip
      t.attachment :room_image
      t.timestamps null: false
    end
  end
end
