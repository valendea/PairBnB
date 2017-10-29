Rails.application.routes.draw do
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
end
