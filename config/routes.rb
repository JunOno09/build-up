Rails.application.routes.draw do
  devise_for :users
  root to: "records#index"
  resources :records do
   resources :comments, only: [:create, :destroy]
   resource :likes, only: [:create, :destroy]
   collection do
    get 'search'
   end
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy] 
end
