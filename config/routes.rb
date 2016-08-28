Rails.application.routes.draw do
  get 'blogs/index'

  get 'blogs/show'

  get     '/signup',  to: 'users#new'
  get     '/signin',  to: 'sessions#new'
  post    '/signin',  to: 'sessions#create'
  delete  '/signout', to: 'sessions#destroy'

  resources :users, except: :index do
    member do
      get :delete
    end
  end

  resources :blogs do
    member do
      get :delete
    end
    resources :posts
  end

  root 'blogs#index'
end
