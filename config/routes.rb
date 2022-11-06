Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :auth do
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
  end

  namespace :company do
  
    get "get", to: "company#get"
    post "create", to: "company#create"

  end

  delete :logout, to: "auth/sessions#logout"
  get :logged_in, to: "auth/sessions#logged_in"
  
  root to: "static#home"
end
