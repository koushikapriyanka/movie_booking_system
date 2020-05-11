Rails.application.routes.draw do
  root to: "home#index"
  resources :home, only: [:index]
  resources :bookings, only: [:index, :show, :new, :create] do
    member do 
      patch :cancel
    end
  end

  resources :theatres, only: [:index]
  resources :movies, only: [:index] do
  	resources :show_details, only: [:index, :show, :new, :create]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
