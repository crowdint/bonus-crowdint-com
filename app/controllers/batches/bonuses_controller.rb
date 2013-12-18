class Batches::BonusesController < ApplicationController
  before_action :set_batch, only: :index

  def index
    service = ReceivedBonusesService.new @batch, current_user
    render json: service.bonuses, each_serializer: UserBonusSerializer, status: :ok
  end

  private
  def set_batch
    @batch = Batch.find params[:batch_id]
  end
end
