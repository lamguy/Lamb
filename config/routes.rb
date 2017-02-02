Rails.application.routes.draw do
  resources :milestones
  resources :tasks do
    resources :task_comments

    put '/follow', to: 'tasks#follow', :as => 'follow'
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
  get 'account/password', to: 'users#change_password', :as => 'change_password'
  post 'account/password', to: 'users#update_password', :as => 'update_password'

  root to: "dashboard#index"
end
