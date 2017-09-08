Rails.application.routes.draw do
  devise_for :users
  root 'representatives#index'

  resources :representatives do
    resources :reviews do
      resources :comments
    end
  end

  resources :reviews do
    resources :comments
  end



  resources :reviews do
    resources :upvotes
    resources :downvotes
  end

  devise_for :users
end
