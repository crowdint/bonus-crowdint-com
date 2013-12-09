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
    if @batch.update(batch_params)
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
    params.permit(:name, :allocation, :organization_id,
                  user_batches_attributes: [:balance, :id])
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end
end
