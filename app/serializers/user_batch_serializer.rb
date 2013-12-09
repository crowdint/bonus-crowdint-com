class UserBatchSerializer < ActiveModel::Serializer
  attributes :id, :balance, :user_id, :batch_id, :user_name
end
