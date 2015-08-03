Rails.application.routes.draw do
  #localhost
  root 'products#home'

  #static pages -  localhost/action
  get 'help' => 'static_pages#help'
  get 'aboutus' => 'static_pages#aboutus'
  get 'term' => 'static_pages#term'
  get 'policy' => 'static_pages#policy'
  get 'contact' => 'static_pages#contact'

  #Home
  get 'index' => 'products#home'
  
  #Product
  get 'products/search' => 'products#search'
  get 'products/newitem' => 'products#newitem'
  match 'products/delete/:id',    to: 'products#destroy',    via: 'post'
  resources :products
  

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
  match '/logout2',    to: 'sessions#destroy',    via: 'get'
  
  #Account Activation
  resources :account_activations, only: [:edit]
  
  #Micropost
  match '/microposts/create',    to: 'microposts#create',    via: 'post'
  resources :microposts,          only: [:create, :destroy]
  #get 'static_pages/home' => 'static_pages#home'

  #POST  /microposts create  create a new micropost
  #DELETE  /microposts/1 destroy delete micropost with id 1

  #match 'static_pages/:action', :controller => "static_pages"

end
