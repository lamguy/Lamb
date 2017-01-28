module Tasks
	module Followable
		extend ActiveSupport::Concern
	
		def follow
			user = current_user
			task = Task.find(params[:task_id])

			respond_to do |format|
				if user.follow(task)
					format.html { redirect_to task, notice: 'Followed task' }
	      			format.json { head :no_content }
				else
					format.html { redirect_to task, notice: 'Not Followed task' }
	      			format.json { head :no_content }
				end
			end
		end
		
	end
end