Rails.application.routes.draw do
  get "pets/new"
  get "pets/create"
  get "pets/show"
  devise_for :users

  root to: "pages#home"

  get "home", to: "pages#home"
  get "profile", to: "pages#profile", as: :profile
  get "pet_sitter_profile/:id", to: "pages#pet_sitter_profile", as: :pet_sitter_profile
  get '/search_pet_sitters', to: 'pages#pet_sitters', as: 'search_pet_sitters'

  resources :pets, only: [ :new, :create, :show, :destroy]

  resources :users, as: "pet_sitter", path: "pet_sitters" do
    collection do
      get :profile
      get :edit_profile
      patch :update_profile
    end
    resources :reservations, only: [ :new, :create ]
  end

  resources :reservations, only: [ :index, :show, :update, :destroy, :edit] do
    resources :messages, only: [ :index, :create, :new ]
    resources :reviews, only: [:create]
  end

  resources :messages, only: [ :show, :destroy ]
  resources :reviews, only: [:show, :create]

 # get '/profile', to: 'users#show', as: 'profile'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
