class CreateHomepagePosts < ActiveRecord::Migration
  def change
    create_table :homepage_posts do |t|
      t.string :post_title
      t.text :post_text
      t.string :post_img_url

      t.timestamps null: false
    end
  end
end
