Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records
  resources :users, only: [:index, :show, :edit, :update]
end
