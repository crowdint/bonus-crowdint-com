class InvitationsController < ApplicationController
  def create
    organization = Organization.find(params[:organization_id])
    status = BonusBatch::Notifier.send_invite params[:to], organization.name


    render json: organization, status: status
  end
end
