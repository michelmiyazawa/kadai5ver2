Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get 'search' => 'searches#search'
end