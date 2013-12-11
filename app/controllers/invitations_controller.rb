class InvitationsController < ApplicationController
  before_action :get_organization
  before_action :set_session, only: [:show]

  def create
    Notifier.send_invite(params[:to], @organization).deliver
    render json: @organization, status: :ok
  end

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
