Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records do
   resources :comments, only: :create
  end
  resources :users, only: [:index, :show, :edit, :update]
end
