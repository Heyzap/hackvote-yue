class ProjectsController < ApplicationController

	def create
		@project = get_event.projects.build(project_params)
		@project.save
		# All we need to do is refresh the page
		redirect_to :back
	end

	def show
	end

	def destroy
	end

	private

		def project_params
			params.require(:project).permit(:name, :creators)
		end

		def get_event
			@event = Event.find_by(id: params[:id])
		end

end
 