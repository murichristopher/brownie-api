
Rails.application.routes.draw do
  # Devise routes with OmniAuth
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: [:sessions, :registrations]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Application routes
  resources :tasks do
    collection do
      get :my_tasks # This defines a route for /tasks/my_tasks
    end
  end
  resources :users, only: %i[index] do
    collection do
      get :me
    end
  end

  resources :dashboard, only: [] do
    collection do
      get :overview
      get :detailed_projects
      get :users_summary
    end
  end

  namespace :api do
    resources :tasks, only: [:index, :create, :show, :update, :destroy]
  end
  
  resources :projects do
    resources :tasks, only: %i[index create]
  end

  # Catch-all for unknown routes (must be last)
  match '*path', to: 'errors#not_found', via: :all
  devise_scope :user do
  match '/users/auth/:provider', to: 'users/omniauth_callbacks#passthru', via: [:get, :head], as: :omniauth_authorize
end
end
