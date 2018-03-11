Rails.application.routes.draw do
  devise_for :users
  root 'places#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places do
    resources :comments, only: :create
    #gives us CRUD for our places model and C for comments
  end
  resources :users, only: :show
end
