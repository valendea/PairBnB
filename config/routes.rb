Rails.application.routes.draw do
  get '/bookings/:id/braintree/new', to: "braintree#new", as:"braintree_new"
  post '/bookings/:id/braintree/checkout', to: 'braintree#checkout', as: "braintree_checkout"

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  resources :bookings
  # get 'users/show'

  get 'users/edit'

  root 'welcome#index'

  get "/listings/:id/verify" => "listings#verify", as: :verify_listing

  resources :users, only: [:show, :edit, :update]

  resources :listings do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:destroy]

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # delete "/"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # Google Auth
  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'sessions#destroy', as: 'signout'

  # resources :sessions, only: [:create, :destroy]
  # resource :home, only: [:show]

  # root to: "home#show"
end
