class Admin::MembershipsController < Admin::BaseController
  before_filter :load_team
  before_filter :load_membership, only: [:edit, :update, :destroy]

  def index
    @memberships = @team.memberships
  end

  def new
    @membership = Membership.new
    @users  = User.all
  end

  def create
    @membership = @team.memberships.build(membership)
    if @membership.save
      redirect_to admin_team_memberships_path(@team), notice: 'The team member was created succesfully'
    else
      render action: :new
    end
  end

  def destroy
    @membership.destroy
    redirect_to admin_team_memberships_path(@team), notice: 'The team member was destroyed succesfully'
  end

  private
  def load_team
    @team = Team.find(params[:team_id])
  end

  def membership
    params.require(:membership).permit(:user_id)
  end

  def load_membership
    @membership = @team.memberships.find(params[:id])
  end
end
