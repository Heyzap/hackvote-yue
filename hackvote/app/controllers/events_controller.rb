class EventsController < ApplicationController

  MAX_VOTES = 3

  def new
    @event = Event.new
    @cur_events = Event.where( completed: false)
    @past_events = Event.where( completed: true)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      session[@event.id] = MAX_VOTES 
      redirect_to @event
      else
      render 'new'
    end
  end

  def show
    @event = Event.find_by_id(params[:id].to_i)
    @projects = @event.projects
  # make sure the user has the cookie limit
  session[@event.id] ||= MAX_VOTES
  @project = @event.projects.build
  end

  def close
  @event = Event.find_by(id: params[:id])
  @projects = @event.projects
  @event.completed = true
  @event.save
  end

  private

  def event_params
    params.require(:event).permit(:title)
  end
end
