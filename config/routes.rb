Rails.application.routes.draw do

  resources :requests, only: [:create, :index, :show]
  resources :users, only: [:create, :show, :update]
  
end
