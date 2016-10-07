class AddFurnitureStyleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :furniture_style, :string
  end
end
