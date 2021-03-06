Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users

  resources :meals, only: %i[index new create edit update show] do
    resources :bookings, only: [:new, :create, :update]
  end
  resources :bookings, only: :destroy
  resources :dashboards, only: :show
end
