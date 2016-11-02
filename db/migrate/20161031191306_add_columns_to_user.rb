class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :referral, :string
    add_column :users, :user_review, :string
    add_column :users, :phone_number, :text
    add_column :users, :email, :text
    add_column :users, :address, :text
    add_column :users, :apt_number, :text
    add_column :users, :city, :text
    add_column :users, :state, :text
    add_column :users, :zip_code, :text
  end
end
