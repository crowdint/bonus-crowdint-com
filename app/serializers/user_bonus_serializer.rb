class UserBonusSerializer < ActiveModel::Serializer
  attributes :id, :amount, :name, :message, :receiver_id, :batch_id
end
