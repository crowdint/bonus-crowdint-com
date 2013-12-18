class BatchesController < ApplicationController
  before_action :set_organization
  before_action :set_batch, only: [:show, :update, :destroy]

  # GET /batches.json
  def index
    @batches = @organization.batches
    render json: @batches, status: :ok
  end

  # GET /batches/1.json
  def show
    render json: @batch, status: :ok
  end

  # POST /batches.json
  def create
    if @batch = @organization.batches.create(batch_params)
      render json: @batch, status: :created
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /batches/1.json
  def update
    if valid_data(batch_params) && @batch.update(batch_params)
      render json: @batch, status: :ok
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /batches/1.json
  def destroy
    @batch.destroy
    head :no_content
  end

  private
  def set_batch
    @batch = @organization.batches.find(params[:id])
  end

  def batch_params
    params.permit(:name, :allocation, :organization_id, :status,
                  user_batches_attributes: [:balance, :user_id, :batch_id, :id],
                  bonuses_attributes: [:id, :receiver_id, :user_id, :amount, :message])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  #TODO  ESTO ESTA HORRIBLE ME DOY VERGUENZA A MI MISMO, APESTO
  def valid_data batch_params
    sum = 0
    max_balance = batch_params['user_batches_attributes'].values[0]['balance'].to_i
    batch_params['bonuses_attributes'].each {|k, v| sum += v['amount'].to_i}
    sum <= max_balance
  end
end
