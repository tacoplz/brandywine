class AddAddressToAboutUs < ActiveRecord::Migration
  def change
    add_column :about_us, :address, :string
  end
end
