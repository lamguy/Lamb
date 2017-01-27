module Projects
  module Teams
    extend ActiveSupport::Concern

    def teams
      @teams = Project.find(params[:id]).teams

      # get the count from the teams efficently
      @team_members_count = TeamMember.all.includes(@teams).group(:team_id).count
    end

    def change_role
      @project = Project.find(params[:id])

      @project_team = @project.teams.find(params[:team_id])
      @project_team.project_ids = params[:id]
      @project_team.role_ids = params[:role_id]

      @project_team.update
    end

    def remove_team
      
    end
  end
end