class Project < ApplicationRecord
  include Projects::Status

  has_many :project_users
  has_many :users, :through => :project_users
  has_many :teams, :through => :project_teams

  has_many :tasks


  # Validation
  validates :name, uniqueness: true, presence: true
end
