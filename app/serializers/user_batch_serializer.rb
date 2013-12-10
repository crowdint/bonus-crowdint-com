class UserBatchSerializer < ActiveModel::Serializer
  attributes :id, :balance, :user_id, :batch_id, :name

  def name
    object.user_name
  end
end
