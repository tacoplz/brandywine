class CreateAboutUs < ActiveRecord::Migration
  def change
    create_table :about_us do |t|
      t.attachment :about_us_image
      t.text :body
      t.string :phone_number, :limit => 10
      t.string :email

      t.timestamps null: false
    end
  end
end
