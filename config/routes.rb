Rails.application.routes.draw do
  root to: "static_pages#home"
  
  resources :users
  resources :sessions

  namespace :admin do
    resources :authors
    resources :books
    resources :categories
  end
end
