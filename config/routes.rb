Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  root to: 'users#index'
  resources :users do
    resources :awakenings, only: :index
  end
  resources :awakenings, only: :create
end
