Rails.application.routes.draw do
<<<<<<< HEAD
  root 'representatives#index'

  resources :representatives do
    resources :reviews do
      resources :comments
    end
  end

  resources :reviews do
    resources :comments
  end
=======
  devise_for :users
  root "main#index"
>>>>>>> master
end
