Rails.application.routes.draw do

  namespace :api do
    post 'authenticate' => 'user_token#create'
    get 'today' => 'entries#index'
    resources :users do
      resources :awakenings, only: :index
    end
    resources :awakenings, only: :create

    match "*path", to: 'application#not_found', via: :all
  end
end
