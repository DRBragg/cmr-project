Rails.application.routes.draw do
  root 'representatives#index'

  resources :representatives do
    resources :reviews do
      resources :comments
    end
  end

  resources :reviews do
    resources :comments
  end
end
