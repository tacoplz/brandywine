# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FurnitureWood.delete_all
FurnitureWood.create!(wood_type: 'Oak')

Product.delete_all
Product.create!(title: 'Mission Nightstand',
  description:
    %{<p>
        Beautifully handcrafted and eloquent, this old fashioned mission nightstand is the perfect resting spot for that iPhone.
      </p>},
  image_url: 'missionnightstand.jpeg',
  room_for_furniture: 'Bedroom',
  furniture_type: 'Nightstand',
  furniture_wood: 'Oak',
  furniture_stain: 'Honey Oak',
  furniture_dimensions: "15\"Lx15\"Wx36\"T")
