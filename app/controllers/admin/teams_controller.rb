class Admin::TeamsController < Admin::BaseController
  before_filter :load_team, only: [:edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team)
    if @team.save
      redirect_to admin_teams_path, notice: 'The team was created succesfully'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @team.update_attributes(team)
      redirect_to admin_teams_path, notice: 'The team was updated succesfully'
    else
      render action: 'edit'
    end
  end

  def destroy
    @team.destroy
    redirect_to admin_teams_path, notice: 'The team was deleted succesfully'
  end

  private
  def team
    params.require(:team).permit(:name)
  end

  def load_team
    @team = Team.find(params[:id])
  end
end
