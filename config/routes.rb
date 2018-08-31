Rails.application.routes.draw do
  get "static_pages/about"

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    get '/', action: :index, controller: 'dashboard'
    resources :articles, :comments
  end

  resources :about
  resources :notifications

  root "articles#index"
end
