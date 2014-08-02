class Admin::EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event)
    if @event.save
      redirect_to admin_events_path, notice: "Event created succesfully"
    else
      render action: :new
    end
  end

  private
  def event
    params.require(:event).permit(:name)
  end
end
