Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meals, only: %i[index new create edit update] do
    resources :bookings, only: [:new, :create, :update]
  end
  resources :bookings, only: :destroy
  resources :dashboards, only: :show
end
