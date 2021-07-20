Rails.application.routes.draw do

 root to: "products#index"
 resources :products, only: [:index, :new,:create]

  devise_for :users

  resources :products, only: [:index, :new, :create, :destroy, :edit, :update, :show]
end
