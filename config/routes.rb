Rails.application.routes.draw do
  resources :furniture_styles
  resources :blogs
  resources :about_us
  resources :line_items
  resources :carts
  get 'admin/index'

  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  resources :users
  resources :homepage_posts
  resources :furniture_types do
    #to query products#index by furniture_type
    #see products_controller index method and furniture_type index.html.erb
    resources :products
  end
  resources :furniture_stains
  resources :furniture_woods
  resources :furniture_rooms do
    #to query products#index by furniture_room
    #see products_controller index method and furniture_room index.html.erb
    resources :products
  end
  resources :products

  #attempt to query index by room_for_furniture
  #get '/products/:room_for_furniture(.:format)' => 'products#index'

  get 'homepage_post/index'

  get '/system/products/images/' => 'products#show'
  get '/system/furniture_rooms/images/' => 'furniture_rooms#show'
  
  #admin routes, use sessions to log admin in and out
  get 'admin' => 'admin#index'
  #wrap the session route declarations in a block and pass them to the
  #controller() (this saves us typing and makes the routes easier to
  #read). Since we did not generate the admin controller using the
  #rails scaffolding we need to define which actions respond to GET,
  #POST, DELETE,ect HTTP Requests so we need to define these actions
  controller :sessions do
    get 'login' => :new #shorten the URL the user has to enter. Now the user just enters /admin and we map it to admin/index
    post 'login' => :create #login will take the place of sessions/create so we can remove it from below
    delete 'logout' => :destroy #logout will now replace sessions/destroy so we can remove it from below
  end

#set the landing page as the index view of HomepagePosts
root 'homepage_posts#index', as: 'home'

#this is so I can have a FurnitureType selector based off of the selection from FurnitureRoom
post 'show_furniture_types' => 'furniture_types#show_furniture_types', as: :show_furniture_types

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
