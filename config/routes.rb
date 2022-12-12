Rails.application.routes.draw do
  root 'top#index'
  resources :tags
  get 'users/show'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
}
  resources :users, only: [:show]
  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
