class ReceivedBonusesService
  attr_accessor :batch

  def initialize batch
    @batch = batch
    @users = batch.users
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
    user.received_bonuses.by_batch(@batch.id).first
  end
end
