class CreateFurnitureRooms < ActiveRecord::Migration
  def change
    create_table :furniture_rooms do |t|
      t.string :room_type

      t.timestamps null: false
    end
  end
end
