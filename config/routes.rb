Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :auth do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
  end

  namespace :companies do
  
    get "get", to: "companies#get"
    post "create", to: "companies#create"

  end

  namespace :clients do
    get "get", to: "clients#get"
    post "create", to: "clients#create"
    put "update/:id", to: "clients#update"
    delete "delete/:id", to: "clients#delete"

  end
  

  delete :logout, to: "auth/sessions#logout"
  get :logged_in, to: "auth/sessions#logged_in"
  
  root to: "static#home"
end
