Rails.application.routes.draw do

  authenticate :user do
    root 'visitors#search', as: :authenticated_root
    resources :searches
    resources :results
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users

end
