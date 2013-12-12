class UserBonusSerializer < ActiveModel::Serializer
  attributes :id, :amount, :name, :message, :user_id, :batch_id
end
