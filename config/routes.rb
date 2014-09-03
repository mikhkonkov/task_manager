Rails.application.routes.draw do

  resources :users do
    scope module: :users do
      resources :tasks do
        collection do
          get :search
        end
        member do
          get :done
        end
      end
    end
  end

  namespace :admin do
    resources :users do
      collection do
        get :fetch_user
      end
      scope module: :users do
        resources :tasks do
          scope module: :tasks do
            resources :comments
          end
        end
      end
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  root 'welcome#index'

  get 'welcome/index'

  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
