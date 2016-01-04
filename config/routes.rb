CarLog::Application.routes.draw do
  root to: 'carlog#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  #get '/cars/:id/log', to: 'logs#new', as: 'log_car'

  resources :cars, except: [:destroy] do
    resources :logs, only: [:new, :create, :edit, :update]
  end

  resources :users, only: [:create, :edit, :show, :update]
 # resources :cars, only: [:new, :create, :edit, :show, :update]
  #resources :logs, only: [:edit]
end
