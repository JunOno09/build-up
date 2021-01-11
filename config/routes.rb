Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records do
   resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
