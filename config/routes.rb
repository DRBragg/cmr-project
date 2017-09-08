Rails.application.routes.draw do
  devise_for :users
  root 'representatives#index'
  resources :users, only: [:show, :edit, :update]

  resources :representatives do
    resources :reviews do
      resources :comments
    end
  end

  resources :reviews do
    resources :comments
  end


end
