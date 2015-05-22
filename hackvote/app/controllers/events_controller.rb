class EventsController < ApplicationController
	include ApplicationHelper

	def new
		@event = Event.new
		@cur_events = Event.where( completed: false)
		@past_events = Event.where( completed: true)
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			cookies.permanent[@event.id] = 3
			redirect_to @event
		else
			render 'new'
		end
	end

	def show
		@event = Event.find(params[:id])
		@projects = @event.project_feed
		# make sure the user has the cookie limit
		cookies.permanent[@event.id] ||= 3
		@event_name = @event.title
		@project = @event.projects.build
	end

	def close
		@event = get_event
		@projects = @event.project_feed
		@event.completed = true
		@event.save
	end


	private

		def event_params
			params.require(:event).permit(:title)
		end
end
