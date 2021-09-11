Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  resources :users, only: [:show,:edit,:update] do
    member do 
      get :followings, :followers
      get 'favorites'
    end
  end
  resources :plans do
    collection do
      get 'search'
      get 'about'
    end
    resources :favorites, only:[:create,:destroy]
    resources :supplements, only: :create
    resources :likes, only: [:create,:destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
