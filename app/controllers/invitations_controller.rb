class InvitationsController < ActionController::Base
  before_action :get_organization, :set_session

  def show
  end

  private
  def get_organization
    @organization = Organization.find params[:organization_id]
  end

  def set_session
    session[:organization_id] = @organization.id if @organization
  end
end
