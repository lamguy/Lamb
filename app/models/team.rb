class Team < ApplicationRecord
  has_many :team_members
  has_many :project_teams

  has_many :users, :through => :team_members
  has_many :projects, :through => :project_teams

  has_many :roles, :through => :project_teams
end
