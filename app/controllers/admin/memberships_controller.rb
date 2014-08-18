class Admin::MembershipsController < Admin::BaseController
  before_filter :load_team
  before_filter :load_membership, only: [:edit, :update, :destroy]

  def index
    @memberships = @team.memberships
  end

  def new
    @membership = Membership.new
    load_users
  end

  def create
    @membership = @team.memberships.build(membership)
    if @membership.save
      redirect_to admin_team_memberships_path(@team), notice: 'The team member was created succesfully'
    else
      load_users
      render action: :new
    end
  end

  def destroy
    name = @membership.name
    @membership.destroy
    redirect_to admin_team_memberships_path(@team), notice: "#{name} was removed from the team succesfully"
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

  def load_users
    @users  = User.order(:name) - @team.users
  end
end
