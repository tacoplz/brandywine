class AddHoursToAboutUs < ActiveRecord::Migration
  def change
    add_column :about_us, :hours, :string
  end
end
