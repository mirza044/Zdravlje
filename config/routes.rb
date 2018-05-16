Rails.application.routes.draw do

  resources :items
  get 'store/index'

  get 'welcome/index'

  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships
  
  resources :posts do
    resources :komentars
  end
  
  resources :articles do
    resources :comments
  end

  #Define root page
  root 'pages#index'

  #Define Routes for Pages
    #get 'pages/index' (delete this line)
  get '/home' => 'pages#home'  #override default 'pages/home' routes
  #get '/profile' => 'pages#profile'
  get '/user/:id'=> 'pages#profile'
  get '/explore' => 'pages#explore'
  get '/new' => 'articles#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
