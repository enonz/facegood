Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :follows
  resources :posts
  devise_for :users, controllers: {
  	omniauth_callbacks: 'users/omniauth_callbacks',
  	sessions: 'users/sessions',
  	registrations: 'users/registrations',

  }
  root 'facegood#facegood'
  get '/', to: 'facegood#facegood'
  post '/', to: 'facegood#facegood'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
