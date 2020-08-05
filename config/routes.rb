Rails.application.routes.draw do
  root to: 'tasks#index'

  devise_for :users
  resources :tasks do
    resource :histories
  end
end
