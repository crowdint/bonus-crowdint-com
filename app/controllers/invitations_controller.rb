class InvitationsController < ApplicationController
  def create
    organization = Organization.find(params[:organization_id])
    Notifier.send_invite(params[:to], organization).deliver
    render json: organization, status: :ok
  end
end
