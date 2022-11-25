Rails.application.routes.draw do
  root "posts#index"
  
  resources :posts do
    resources :comments
  end

  resource :session, only: [:new, :create, :destroy]

  #resources :sessions
  
  resources :users
  get "signup" => "users#new"
  
end
