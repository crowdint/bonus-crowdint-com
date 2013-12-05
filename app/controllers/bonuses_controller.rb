class BonusesController < ApplicationController
  before_action :set_bonus, only: [:show, :update, :destroy]

  # GET /bonuses.json
  def index
    @bonuses = Bonus.all
    render json: @bonuses, status: :ok
  end

  # GET /bonuses/1.json
  def show
    render json: @bonus, status: :ok
  end


  # POST /bonuses.json
  def create
    @bonus = Bonus.new(bonus_params)

    if @bonus.save
      render json: @bonus, status: :created, location: @bonus
    else
      render json: @bonus.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bonuses/1.json
  def update
    if @bonus.update(bonus_params)
      head :no_content
    else
      render json: @bonus.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bonuses/1.json
  def destroy
    @bonus.destroy
    head :no_content
  end

  private
  def set_bonus
    @bonus = Bonus.find(params[:id])
  end

  def bonus_params
    params.require(:bonus).permit(:message, :amount)
  end
end
