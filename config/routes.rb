Rails.application.routes.draw do
  
  root 'auctions#index'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  #devise_for :users
  
  resources :auctions
  resources :users do
    resources :posts
    end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
