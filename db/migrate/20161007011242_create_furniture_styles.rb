class CreateFurnitureStyles < ActiveRecord::Migration
  def change
    create_table :furniture_styles do |t|
      t.string :furniture_style
      t.attachment :furniture_style_image

      t.timestamps null: false
    end
  end
end
