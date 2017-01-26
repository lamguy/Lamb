Rails.application.routes.draw do
  resources :milestones
  resources :tasks do
    resources :task_comments
  end

  get 'dashboard/index'

  resources :projects
  get 'projects/:id/teams', to: 'projects#teams'

  resources :teams
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users

  root to: "dashboard#index"
end
