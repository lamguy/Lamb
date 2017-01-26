module Projects
  module Teams
    extend ActiveSupport::Concern

    def teams
      @teams = Project.find(params[:id]).teams

      # get the count from the teams efficently
      @team_members_count = TeamMember.all.includes(@teams).group(:team_id).count
    end

    def role
      
    end
  end
end