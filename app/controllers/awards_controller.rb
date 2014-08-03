class AwardsController < ApplicationController
  before_filter :load_event

  def index
    @awards = current_user.awards.where(event_id: @event.id)
  end

  def new
    @award = Award.new
    @users = User.where.not(id: current_user.id).order(:name)
  end

  def create
    @award      = @event.awards.build(award)
    @award.user = current_user
    if @award.save
      redirect_to event_awards_path(@event)
    else
      render action: :new
    end
  end

  private
  def award
    params.require(:award).permit(:receiver_id, :points)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end
end
