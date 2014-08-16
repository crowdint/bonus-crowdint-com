class Admin::TeamsController < Admin::BaseController
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

  private
  def team
    params.require(:team).permit(:name)
  end
end
