class AddFurnitureRoomIdToFurnitureType < ActiveRecord::Migration
  def change
    add_reference :furniture_types, :furniture_room, index: true, foreign_key: true
  end
end
