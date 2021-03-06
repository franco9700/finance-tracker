Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my-portfolio', to: 'users#my_portfolio'
  get 'my-friends', to: 'users#my_friends'
  get 'search-stock', to: 'stocks#search'
  get 'search-friend', to: 'friends#search'
  resources :users, only: [:show]
end

