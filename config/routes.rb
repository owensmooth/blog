Rails.application.routes.draw do
  get 'articles/index'
  get 'about/show'

  resources :articles, only: [:index, :show] do
    resources :comments
  end

  namespace :admin do
    resources :articles, :comments
  end

  root 'articles#index'
end
