class CreateFurnitureWoods < ActiveRecord::Migration
  def change
    create_table :furniture_woods do |t|
      t.string :wood_type

      t.timestamps null: false
    end
  end
end
