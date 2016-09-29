class CreateFurnitureTypes < ActiveRecord::Migration
  def change
    create_table :furniture_types do |t|
      t.string :furniture_room_for_class
      t.string :furniture_class
      #add image for use with paperclip
      t.attachment :furniture_type_image

      t.timestamps null: false
    end
  end
end
