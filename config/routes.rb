Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }
  resources :admin, only: [:index]
  resources :users, only: [:edit, :update]
  resources :events, only: [:index, :show]
  patch '/events/:id/rsvp/:rsvp', to: 'rsvps#update', as: :rsvp
  root 'events#index'
end
