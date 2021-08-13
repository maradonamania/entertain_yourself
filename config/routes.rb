Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  resources :users, only: :show
  resources :plans do
    resources :supplements, only: :create
  end
end
