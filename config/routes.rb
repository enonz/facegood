Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  	omniauth_callbacks: 'users/omniauth_callbacks',
  	sessions: 'users/sessions',
  	registrations: 'users/registrations',

  }
  root 'facegood#facegood'
  get '/', to: 'facegood#facegood'
  get 'index', to: 'facegood#index'
  post '/', to: 'facegood#facegood'
  resources :likes
  resources :comments
  resources :follows
  resources :posts
  get 'users/log_out', to: 'users#log_out'
  get 'like', to: 'facegood#like'
  post 'post_comment', to: 'facegood#post_comment'
  get 'follow', to: 'facegood#follow'
  get ':post_id', to: 'facegood#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
