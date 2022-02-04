Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"

  #resources :users, only: [:new, :create] do
    resources :items, only: [:index, :create, :new]
  #end


end
