Rails.application.routes.draw do
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/users' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  put '/games' => 'games#update'
  put '/games/:id' => 'games#update'
  put '/teams/:id' => 'teams#update'
  put '/teams/' => 'teams#update'

  resources :users, except: [:new, :edit]
  resources :locations, except: [:new, :edit]
  resources :leagues, except: [:new, :edit]
  resources :teams, except: [:new, :edit]
  resources :seasons, except: [:new, :edit]
  resources :rosters, except: [:new, :edit]
  resources :games, except: [:new, :edit]
  resources :stats, except: [:new, :edit]
  #resources :books, except: [:new, :edit]
end
