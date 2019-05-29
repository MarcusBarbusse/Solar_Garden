Rails.application.routes.draw do
  devise_for :users
  root to: 'gardens#index'
  resources :gardens do
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
