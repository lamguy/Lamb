class Role < ApplicationRecord
  has_many :teams, :through => :project_teams
  has_many :projects, :through => :project_teams
  
  # Check if user is authorized by minimum role
  # Using the power value to determine if user has sufficent privileges
  def is_authorized(min_role)
    @roles = Role.all.group(:name)

    authorized = false
    if @roles[self[:name]] >= @roles[min_role]
      authorized = true
    end

    return authorized
  end
end
