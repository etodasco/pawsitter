Rails.application.routes.draw do
  get "pets/new"
  get "pets/create"
  get "pets/show"
  devise_for :users

  root to: "pages#home"

  get "home", to: "pages#home"
  get "profile", to: "pages#profile", as: :profile
  get "pet_sitter_profile/:id", to: "pages#pet_sitter_profile", as: :pet_sitter_profile

  resources :pets, only: [ :new, :create, :show ]

  resources :users, as: "pet_sitter", path: "pet_sitters" do
    resources :reservations, only: [ :new, :create ]
  end

  resources :reservations, only: [ :index, :show, :update, :destroy, :edit] do
    resources :messages, only: [ :index, :create, :new ]
    resources :reviews, only: [:create]
  end

  resources :messages, only: [ :show, :destroy ]
  resources :reviews, only: [:show]

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
