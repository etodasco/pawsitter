Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # get "profile/:id", to: "pages#profile", as: :profile
  resources :pets

  resources :users, as: "pet_sitter", path: "pet_sitters" do
    resources :reservations, only: [ :new, :create ]
  end

  resources :reservations, only: [ :index, :show, :update, :destroy, :edit] do
    resources :messages, only: [ :index, :create, :new ]
    resources :reviews, only: [:create]
  end


  resources :messages, only: [ :show, :destroy ]
  resources :reviews, only: [:show]

get '/profile', to: 'users#show', as: 'profile'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
