Rails.application.routes.draw do
  get "/signup", to: "users#new"
  get "about/show"

  resources :articles, only: [:index, :show] do
    resources :comments
    resources :notifications
  end

  namespace :admin do
    get '/', action: :index, controller: 'dashboard'
    resources :articles, :comments, :users
  end

  resources :users
  resources :about
  resources :notifications

  root "articles#index"
end
