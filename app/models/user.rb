class User < ApplicationRecord
  has_many :team_members
  has_many :teams, :through => :team_members

  has_many :project_users
  has_many :projects, :through => :project_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
