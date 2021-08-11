Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  resources :plans do
    resources :supplements, only: :create
  end
end
