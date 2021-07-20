Rails.application.routes.draw do

 root to: "products#index"

  devise_for :users

  resources :products, only: [:index, :new, :create, :edit, :update, :show]
end