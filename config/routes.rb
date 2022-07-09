Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, controllers: {registrations: 'users/registrations'}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users

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
