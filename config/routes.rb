Rails.application.routes.draw do
  root 'representatives#index'

  devise_for :users

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

  namespace :api do
    namespace :v1 do
      resources :representatives do
        resources :reviews do
          resources :comments
        end
      end
    end
  end
end
