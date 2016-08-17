Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }
  resources :events, only: [:index, :show]
  patch '/events/:id/rsvp/:rsvp', to: 'rsvps#update', as: :rsvp
  root 'events#index'
end
