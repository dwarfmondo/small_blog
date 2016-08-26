Rails.application.routes.draw do
  get     '/signup',  to: 'users#new'
  get     '/signin',  to: 'sessions#new'
  post    '/signin',  to: 'sessions#create'
  delete  '/signout', to: 'sessions#destroy'

  resources :users, except: :index do
    member do
      get :delete
    end
  end
end
