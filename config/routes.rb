Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :tasks do
    resources :histories
  end
  get "calendar" => "tasks#calendar"
end
