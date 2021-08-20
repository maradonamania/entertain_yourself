Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  resources :users, only: [:show,:edit,:update]
  resources :plans do
    collection do
      get 'search'
    end
    resources :supplements, only: :create
    resources :likes, only: [:create,:destroy]
  end
end
