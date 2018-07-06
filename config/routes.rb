Rails.application.routes.draw do
  get 'users/new'
  get 'articles/index'
  get 'about/show'
  get '/signup', to: 'users#new'

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :articles, :comments
  end

  resources :users

  root 'articles#index'
end
