Rails.application.routes.draw do
  resources :milestones
  resources :tasks do
    resources :task_comments
  end

  get 'dashboard/index'

  resources :projects

  get 'projects/:id/teams', to: 'projects#teams', :as => 'project_teams'
  post 'projects/switch', to: 'projects#switch', :as => 'project_switch'
  post 'projects/:id/teams/:team_id/role', to: 'projects#change_role', :as => 'project_role'
  delete 'projects/:id/teams/:team_id/remove', to: 'projects#remove_team', :as => 'project_team'

  resources :teams
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users

  root to: "dashboard#index"
end
