class User < ApplicationRecord
  has_many :team_members
  has_many :teams, :through => :team_members

  has_many :project_users
  has_many :projects, :through => :project_users

  has_many :owned_tasks, :class_name => 'Task', :foreign_key => 'assigner_id'
  has_many :assigned_tasks, :class_name => 'Task', :foreign_key => 'assignee_id'

  has_many :task_comments

  has_one :role, :through => :project_teams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
