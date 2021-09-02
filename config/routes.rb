Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  resources :users, only: [:show,:edit,:update] do
    member do 
      get :followings, :followers
    end
  end
  resources :plans do
    collection do
      get 'search'
      get 'about'
    end
    resources :supplements, only: :create
    resources :likes, only: [:create,:destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
