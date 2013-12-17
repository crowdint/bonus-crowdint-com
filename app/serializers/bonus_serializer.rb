class BonusSerializer < ActiveModel::Serializer
  attributes :id, :message, :amount, :receiver_id, :user_id, :name, :sender_name

  def name
    object.receptor_name
  end

  def sender_name
    object.user.name
  end
end
