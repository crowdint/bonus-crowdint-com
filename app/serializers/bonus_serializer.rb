class BonusSerializer < ActiveModel::Serializer
  attributes :id, :message, :amount, :receiver_id, :user_id, :name

  def name
    object.receptor_name
  end
end
