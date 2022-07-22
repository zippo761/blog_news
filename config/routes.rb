require 'sidekiq/web'

Rails.application.routes.draw do

  ## if u want visit sidekiq dashboard, sign_in admin account
  authenticate :user, ->(u) { u.is_admin? } do
    mount Sidekiq::Web.new, at: '/jobs'
  end

  root 'posts#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
    member do
      get :show_grants
      patch :set_grants
    end
  end

  resources :posts do
    resources :comments
  end
end
