Rails.application.routes.draw do
  resources :tasks
  get 'dashboard/index'

  resources :projects
  resources :teams
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "dashboard#index"
end
