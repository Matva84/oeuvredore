Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "projects/new", to: "projects#new"
  resources :projects do
    resources :tasks, only: [:new, :create, :edit, :update]
  end
  resources :tasks, only: :destroy
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :documents
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
