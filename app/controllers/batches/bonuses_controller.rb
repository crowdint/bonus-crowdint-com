class Batches::BonusesController < ApplicationController
  before_action :set_batch, only: :index

  def index
    service = ReceivedBonusesService.new service_params
    render json: service.bonuses, each_serializer: UserBonusSerializer, status: :ok
  end

  private
  def service_params
    { batch: @batch, user: (current_user if params[:for_current_user]) }
  end

  def set_batch
    @batch = Batch.find params[:batch_id]
  end
end
