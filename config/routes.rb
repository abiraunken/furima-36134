Rails.application.routes.draw do

 root to: "products#index"

  devise_for :users

  resources :products,  [:index, :new, :create,:destroy, :edit, :update, :show]
end