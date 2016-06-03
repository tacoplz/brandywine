class CreateFurnitureStains < ActiveRecord::Migration
  def change
    create_table :furniture_stains do |t|
      t.string :stain_type

      t.timestamps null: false
    end
  end
end
