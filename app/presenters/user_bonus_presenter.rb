class UserBonusPresenter
  include ActiveModel::Serialization

  def initialize args
    @bonus = args[:bonus]
    @user = args[:user]
    @batch = args[:batch]
  end

  def amount
    @bonus && @bonus.amount
  end

  def name
    @user.name
  end

  def message
    @bonus && @bonus.message
  end

  def id
    @bonus && @bonus.id
  end

  def user_id
    @user.id
  end

  def batch_id
    @batch.id
  end
end
