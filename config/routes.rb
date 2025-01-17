Rails.application.routes.draw do

  root 'static_pages#home'

  # Static pages routes
  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'leaderboard', to: 'static_pages#leaderboard'

  # Omniauth Routes
  get '/stackoverflow', to: 'stack_users#new', as: :stackoverflow
  get '/twitter', to: 'twitter_users#new', as: :twitter

  # Omniauth CallBack Routes
  get '/auth/stackexchange/callback', to: 'stack_users#create'
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/twitter/callback', to: 'twitter_users#create'

  # Omniauth Authentication Errors Routes
  get '/auth/failure', to: 'sessions#failure'

  # Session and Users routes
  get '/signin', to: 'sessions#new', as: :signin
  get '/logout', to: 'users#logout', as: :logout
  get 'profile', to: 'users#profile', as: :profile
  get 'compare', to: 'users#compare', as: :compare

  # User Update and other users profile
  resources :users, only: [:show, :update]

  # Relationships routes to follow and unfollow users
  resources :relationships, only: [:create, :destroy]

  # Routes to deal with followers and following
  get 'following', to: 'users#following', as: :following
  get 'followers', to: 'users#followers', as: :followers
  post 'follow/:tw_id', to: 'users#follow', as: :follow
  post 'unfollow/:tw_id', to: 'users#unfollow', as: :unfollow

end
