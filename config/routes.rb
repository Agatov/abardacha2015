Rails.application.routes.draw do

  root to: "landings#prototype_lp"

  resources :landings, only: :index do
    get :prototype_lp, on: :collection
  end

  resources :orders, only: :create

  namespace :api do
    resources :orders, only: :create
  end
end
