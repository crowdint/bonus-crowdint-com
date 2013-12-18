class UserBonusPresenter
  include ActiveModel::Serialization

  #TODO refactor and split to different presenters or services
  def initialize args
    @bonuses = args[:bonuses]
    @user = args[:user]
    @batch = args[:batch]
  end

  def amount
    @bonuses && @bonuses.sum(:amount)
  end

  def name
    @user.name
  end

  def message
    @bonuses.first && @bonuses.first.message
  end

  def id
    @bonuses.first && @bonuses.first.id
  end

  def receiver_id
    @user.id
  end

  def batch_id
    @batch.id
  end
end
