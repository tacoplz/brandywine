class CreateFurnitureTypes < ActiveRecord::Migration
  def change
    create_table :furniture_types do |t|
      t.string :furniture_room_for_class
      t.string :furniture_class

      t.timestamps null: false
    end
  end
end
