Rails.application.routes.draw do
  devise_for :users
  resources :plans, only: :index

  root to: 'plans#index'
end
