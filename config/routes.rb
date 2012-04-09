SydneyStartups::Application.routes.draw do
  root :to => 'root#index'
  resources :users, :only => [:new]
  resources :companies, :only => [:new, :create, :show] do
    member do
      get :thanks
    end
  end

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/signout' => 'sessions#destroy', as: 'signout'
  match '/signin' => 'sessions#new', as: 'signin'

  namespace :admin do
    root :to => 'companies#index'
    resources :companies
  end
end
