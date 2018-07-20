Rails.application.routes.draw do
  get "/signup", to: "users#new"

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :articles, :comments
  end

  resources :users
  resources :about

  root "articles#index"
end
