Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tunes#new"
  resources :tunes do 
    collection do
      get :index
      get :new
      get "setting_field"
      patch :update
      post :create
    end
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth, only: [:create, :destroy]
      resources :notification_tokens, only: :create
    end
  end

  namespace :turbo do
    namespace :ios do
      resource :path_configuration, only: :show
    end
    namespace :android do
      resource :path_configuration, only: :show
    end
  end
  
end
