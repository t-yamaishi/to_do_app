Rails.application.routes.draw do
  root 'top#index'
  resources :tags
  #get 'users/show'
  get 'users/disconnect'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "omniauth_callbacks"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  get 'posts/ajax_index'
  get 'posts/month'

  resources :users, only: [:show]
  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
