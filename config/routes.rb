Rails.application.routes.draw do
 
  get 'sessions/new'

  get 'users/new'

  #localhost
  root 'home#index'

  #static pages -  localhost/action
  get 'help' => 'static_pages#help'
  get 'aboutus' => 'static_pages#aboutus'
  get 'term' => 'static_pages#term'
  get 'policy' => 'static_pages#policy'
  get 'contact' => 'static_pages#contact'

  #Home
  get 'index' => 'home#index'

  #Account
  #get 'login' => 'account#login'
  #get 'profile' => 'account#profile'
  #get 'logout' => 'account#logout'
  #match '/login',    to: 'account#login',    via: 'get'
  #match '/logout',    to: 'account#logout',    via: 'get'
  #match '/profile',    to: 'account#profile',    via: 'get'
  
  #Product
  get 'product/:id' => 'product#show'

  #User 
  get 'signup'  => 'users#new'
  resources :users
    #GET /users  index users_path  page to list all users
    #GET /users/1  show  user_path(user) page to show user
    #GET /users/new  new new_user_path page to make a new user (signup)
    #POST  /users  create  users_path  create a new user
    #GET /users/1/edit edit  edit_user_path(user)  page to edit user with id 1
    #PATCH /users/1  update  user_path(user) update user
    #DELETE  /users/1  destroy user_path(user) delete user

  #Sessions
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  
  #match 'static_pages/:action', :controller => "static_pages"

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
