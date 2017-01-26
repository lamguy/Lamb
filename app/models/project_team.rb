class ProjectTeam < ApplicationRecord
  belongs_to :project
  belongs_to :team
  belongs_to :role
end
