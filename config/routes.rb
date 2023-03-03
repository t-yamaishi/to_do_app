Rails.application.routes.draw do
  root 'top#index'
  get 'users/line_disconnect'
  get 'posts/ajax_index'
  get 'posts/month_calendar'
  resources :tags, only:[:index, :edit, :create, :update, :destroy]
  resources :posts, only:[:index, :edit, :create, :update, :destroy]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: "omniauth_callbacks"
  }
  resources :users, only: [:show]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
