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
      
      project_team = @project.project_teams.where(team_id: params[:team_id])
      project_team.update(:team_id=> params[:team_id], :role_id=> params[:role_id])
       
      respond_to do |format|
          format.html { redirect_to project_teams_url(@project.id), notice: 'Role changed.' }
          format.json { head :no_content }
      end
      
    end

    def remove_team
      
    end
  end
end