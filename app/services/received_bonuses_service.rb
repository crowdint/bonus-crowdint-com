class ReceivedBonusesService
  attr_accessor :batch

  def initialize batch, current_user
    @batch = batch
    @users = batch.users
    @current_user = current_user
  end

  def bonuses
    @users.collect do |user|
      UserBonusPresenter.new(
        user: user,
        bonus: received_bonus(user),
        batch: @batch)
    end
  end

  def received_bonus user
    user.received_bonuses.by_batch(@batch.id).where(user_id: @current_user.id).first
  end
end
