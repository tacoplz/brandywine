# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FurnitureWood.delete_all
FurnitureWood.create!(wood_type: 'Oak')
FurnitureWood.create!(wood_type: 'Cherry')

FurnitureType.delete_all

FurnitureRoom.delete_all
#code to find furniture_room "bedroom" image and set as variables.
image_path = "#{Rails.root}/public/system/furniture_rooms/room_images/000/000/001/original/bedroom.jpg"
image_file = File.new(image_path)
FurnitureRoom.create!(id: 1,
  room_type: 'Bedroom',
  #set the image as an asset (uploaded file) similar to how paperclip gem works
  room_image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)
#code to find furniture_room "living room" image and set as variables.
image_path = "#{Rails.root}/public/system/furniture_rooms/room_images/000/000/002/original/living_room.jpg"
image_file = File.new(image_path)
FurnitureRoom.create!(id: 2,
  room_type: 'Living Room',
  #set the image as an asset (uploaded file) similar to how paperclip gem works
  room_image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)


#code to find furniture_type "nightstand" image and set as variables.
image_path = "#{Rails.root}/public/system/furniture_types/furniture_type_images/000/000/001/original/missionnightstand.jpeg"
image_file = File.new(image_path)
FurnitureType.create!(furniture_room_for_class: 'Bedroom',
  furniture_class: 'Nightstand',
  furniture_room_id: 1,
  #set the image as an asset (uploaded file) to how paperclip gem works
  furniture_type_image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)
#code to find furniture_type "coffee table" image and set as variables.
image_path = "#{Rails.root}/public/system/furniture_types/furniture_type_images/000/000/002/original/mission_coffee_table.jpg"
image_file = File.new(image_path)
FurnitureType.create!(furniture_room_for_class: 'Living Room',
  furniture_class: 'Coffee Table',
  furniture_room_id: 2,
  #set the image as an asset (uploaded file) to how paperclip gem works
  furniture_type_image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)

FurnitureStain.delete_all
FurnitureStain.create!(stain_type: 'S-2')
FurnitureStain.create!(stain_type: 'Honey Oak')

LineItem.delete_all

Product.delete_all
#code to find product "mission nightstand" image and set as variables.
image_path = "#{Rails.root}/public/system/products/images/000/000/001/original/missionnightstand.jpeg"
image_file = File.new(image_path)
Product.create!(title: 'Mission Nightstand',
  description:
    %{<p>
        Set your iPhone on this to charge the shit out of that fucker.
      </p>},
  room_for_furniture: 'Bedroom',
  furniture_type: 'Nightstand',
  furniture_wood: 'Oak',
  furniture_stain: 'S-2',
  #set the image as an asset (uploaded file) to how paperclip gem works
  image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)
#code to find product "mission coffee table" image and set as variables.
image_path = "#{Rails.root}/public/system/products/images/000/000/002/original/mission_coffee_table.jpg"
image_file = File.new(image_path)
Product.create!(title: 'Mission Coffee Table',
  description:
    %{<p>
        Set your beer here while you watch football and try to forget about the disappointment you've become.
      </p>},
  room_for_furniture: 'Living Room',
  furniture_type: 'Coffee Table',
  furniture_wood: 'Oak',
  furniture_stain: 'S-2',
  #set the image as an asset (uploaded file) to how paperclip gem works
  image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)
#code to find product "shaker nightstand" image and set as variables.
image_path = "#{Rails.root}/public/system/products/images/000/000/003/original/shaker_nightstand.jpg"
image_file = File.new(image_path)
Product.create!(title: 'Shaker Nightstand',
  description:
    %{<p>
        Mover and shaker nightstand.
      </p>},
  room_for_furniture: 'Bedroom',
  furniture_type: 'Nightstand',
  furniture_wood: 'Oak',
  furniture_stain: 'Honey Oak',
  #set the image as an asset (uploaded file) to how paperclip gem works
  image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)

AboutU.delete_all
image_path = "#{Rails.root}/public/system/about_us/about_us_images/000/000/001/original/amish-672179_960_720.jpg"
image_file = File.new(image_path)
AboutU.create!(body: 'Brandywine Furniture has been in business since 1988. We started in a barn. It gave a very rustic feel, and offered low overhead. In 2003, we moved to our current location. It offers a much better environment for the furniture; see our care and feeding of furniture section.

Brandywine Furniture believes that it can provide Quality Amish Furniture at a Comfortable Price. We work with a large variety of Amish Furniture builders in the area to produce quality furniture.',
  phone_number: '3303435842',
  email: 'brandywinefurniture@yahoo.com',
  address: '2456 Pyle Rd Dover, Oh 44622',
  hours: 'Thurs: 10am - 5pm
Fri: 10am - 5pm
Sat: 10am - 4pm

Closed Sun-Wed',
  #set the image as an asset (uploaded file) to how paperclip gem works
  about_us_image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)

HomepagePost.delete_all
HomepagePost.create!(post_title: 'Closed for the season',
  post_text: 'Peace out bitches. Closed January and February. Shows available by appointment only.')

User.delete_all
image_path = "#{Rails.root}/public/system/users/user_images/000/000/001/original/Erin.jpg"
image_file = File.new(image_path)
User.create!(name: 'Erin',
  password_digest: '$2a$10$q/vxYRcXfSK5e4PUhFzZ8uCfnv1Rl.aJGhdLfruY63mCaCOcfN6zK',
  #set the image as an asset (uploaded file) to how paperclip gem works
  user_image: ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    #detect the image's mime type with MIME if you can't provide it yourself
    type: MIME::Types.type_for(image_path).first.content_type
  )
)
