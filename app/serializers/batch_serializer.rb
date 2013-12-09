class BatchSerializer < ActiveModel::Serializer
  attributes :id, :name, :allocation, :user_balance, :status
  has_many :user_batches

  def user_balance
    user = object.user_batches.where(user: scope).first
    user && user.balance
  end
end
