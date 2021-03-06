class Admin::EventsController < Admin::BaseController
  before_filter :load_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @teams = Team.all
  end

  def create
    @event         = Event.new(event)
    @event.creator = current_user

    if @event.save
      redirect_to admin_events_path, notice: "Event created succesfully"
    else
      @teams = Team.all
      render action: :new
    end
  end

  def edit
    @teams = Team.all
  end

  def update
    if @event.update_attributes(event)
      redirect_to admin_events_path, notice: "Event updated succesfully"
    else
      @teams = Team.all
      render action: :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
  end

  private
  def event
    params.require(:event).permit(:name, :opens_at, :team_id)
  end

  def load_event
    @event = Event.find(params[:id])
  end
end
