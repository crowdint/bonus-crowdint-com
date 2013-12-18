class ReceivedBonusesService
  attr_accessor :batch

  def initialize args
    @batch = args[:batch]
    @users = @batch.users
    @current_user = args[:user]
  end

  def bonuses
    @users.collect do |user|
      UserBonusPresenter.new(
        user: user,
        bonuses: received_bonus(user),
        batch: @batch)
    end
  end

  def received_bonus user
    bonuses = user.received_bonuses.by_batch(@batch.id)
    bonuses = bonuses.where(user_id: @current_user.id) if @current_user
    bonuses
  end
end
