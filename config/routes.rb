Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users

  resources :posts do
    resources :comments
  end
end
