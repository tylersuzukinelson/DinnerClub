Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }
  resources :admin, only: [:index] do
    collection do
      get '/users', to: 'admin#users', as: :users
      patch '/toggle_user/:id', to: 'admin#toggle_user', as: :toggle_user
    end
  end
  resources :users, only: [:edit, :update]
  resources :events
  patch '/events/:id/rsvp/:rsvp', to: 'rsvps#update', as: :rsvp
  root 'events#index'
end
