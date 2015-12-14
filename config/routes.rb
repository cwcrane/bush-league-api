Rails.application.routes.draw do
  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  post '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :users, except: [:new, :edit]
  resources :locations, except: [:new, :edit]
  resources :leagues, except: [:new, :edit]
  resources :teams, except: [:new, :edit]
  resources :seasons, except: [:new, :edit]
  resources :rosters, except: [:new, :edit]
  resources :games, except: [:new, :edit]
  resources :player_stats, except: [:new, :edit]
  #resources :books, except: [:new, :edit]
end
