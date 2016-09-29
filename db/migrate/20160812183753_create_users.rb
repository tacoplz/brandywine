class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      #add image for use with paperclip
      t.attachment :user_image

      t.timestamps null: false
    end
  end
end
