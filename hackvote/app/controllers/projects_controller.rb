class ProjectsController < ApplicationController
	include ApplicationHelper

	def create
		@project = get_event.projects.build(project_params)
		@project.project_id = @project.id
		@project.save
		# All we need to do is refresh the page
		redirect_to :back
	end

	def show
	end

	def destroy
	end

	def vote
		@project = Project.find_by(id: params[:project_id])
		@event = Event.find_by(id: @project.event_id)
		vote_count = cookies[@event.id].to_i - 1
		if vote_count >= 0
			cookies.permanent[@event.id] = vote_count.to_s
			@project.votes += 1
			@project.save
		end
		redirect_to :back
	end

	private

		def project_params
			params.require(:project).permit(:name, :creators)
		end

		# def get_event
		# 	@event = Event.find_by(id: params[:id])
		# end

end
 