class Admin::MembersController < Admin::BaseController
  before_filter :load_team
  before_filter :load_member, only: [:edit, :update, :destroy]

  def index
    @members = @team.members
  end

  def new
    @member = Member.new
    @users  = User.all
  end

  def create
    @member = @team.members.build(member)
    if @member.save
      redirect_to admin_team_members_path(@team), notice: 'The team member was created succesfully'
    else
      render action: :new
    end
  end

  def destroy
    @member.destroy
    redirect_to admin_team_members_path(@team), notice: 'The team member was destroyed succesfully'
  end

  private
  def load_team
    @team = Team.find(params[:team_id])
  end

  def member
    params.require(:member).permit(:user_id)
  end

  def load_member
    @member = @team.members.find(params[:id])
  end
end
