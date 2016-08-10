Rails.application.routes.draw do

  resources :requests, only: [:create, :index, :update]
  resources :users, only: [:create, :index, :show, :update]
end
