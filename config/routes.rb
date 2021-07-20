Rails.application.routes.draw do

 root to: "products#index"

  devise_for :users

  resources :products, only: [:index, :new, :create, :destroy, :edit, :update, :show]
end