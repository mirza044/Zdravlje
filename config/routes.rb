Rails.application.routes.draw do

  devise_for :users
  resources :posts
  #Define root page

  root 'pages#index'

  #Define Routes for Pages

#get 'pages/index' (delete this line)
  get '/home' => 'pages#home'  #override default 'pages/home' routes
  #get '/profile' => 'pages#profile'
  get '/user/:id'=> 'pages#profile'
  get '/explore' => 'pages#explore'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
