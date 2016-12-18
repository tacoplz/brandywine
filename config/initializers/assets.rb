# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


#This app uses a POST HTTP method to call the furniture_types based upon the furniture_room chosen when adding a new
#product. The asset pipeline (specifically the //= require tree in application.js) loads this call based on
#the products.js file everytime a page is loaded. This code precompiles all assets for all controllers since
#the code in application.html.erb calls for each javascript_include_tag to be loaded for the params[:controller]
#the functionality in application.html.erb and below was written by the developer (me).
%w( about_us account_activations admin application blogs carts furniture_rooms furniture_stains furniture_styles furniture_types furniture_woods homepage_posts line_items password_resets products roles sessions users ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css", "#{controller}.coffee"]
end
