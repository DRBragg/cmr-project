Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
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

  namespace :api do
    namespace :v1 do
      resources :representatives, only: [:index, :show] do
        get '/representatives' => 'representatives#index'
        post 'post/representatives' => 'representatives#create'
          resources :reviews do
            get '/reviews' => 'representatives#show'
            post '/reviews' => 'reviews#create'
          resources :comments
        end
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reviews do
        resources :comments
          get '/reviews/review_id/comments' => 'representatives#show'
          post '/reviews/review_id/comments' => 'comments#create'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :comments
        get '/reviews/review_id/comments' => 'representatives#show'
        post '/reviews/review_id/comments' => 'comments#create'
    end
  end

  match '/representatives' => 'representatives#create', via: :post
  match '/representatives' => 'representatives#create', via: :get
end
