CarLog::Application.routes.draw do
  root to: 'carlog#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:create, :edit, :show, :update]
  resources :cars, only: [:create, :edit, :show, :update]
  resources :logs, only: [:create, :edit, :show, :update]
end
