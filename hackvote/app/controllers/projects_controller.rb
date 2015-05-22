class ProjectsController < ApplicationController

	def create
		@project = Event.find_by(id: params[:event_id]).projects.build(project_params)
		@project.save
		# All we need to do is refresh the page
		redirect_to :back
	end

	def show
	end

	def destroy
	end

	def vote
		@project = Project.find_by(id: params[:id])
		@event = Event.find_by(id: @project.event_id)
		vote_count = session[@event.id].to_i - 1
		if vote_count >= 0
			session[@event.id] = vote_count.to_s
			@project.votes += 1
			@project.save
		end
		redirect_to :back
	end

	private

		def project_params
			params.require(:project).permit(:name, :creators)
		end

end
 