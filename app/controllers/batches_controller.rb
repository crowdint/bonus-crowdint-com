class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :update, :destroy]

  # GET /batches.json
  def index
    @batches = Batch.all
    render json: @batches, status: :ok
  end

  # GET /batches/1.json
  def show
    render json: @batch, status: :ok
  end

  # POST /batches.json
  def create
    @batch = Batch.new(batch_params)
    if @batch.save
      render json: @batch, status: :created, location: @batch
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /batches/1.json
  def update
    if @batch.update(batch_params)
      head :no_content
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
    @batch = Batch.find(params[:id])
  end

  def batch_params
    params.require(:batch).permit(:name, :allocation)
  end
end
