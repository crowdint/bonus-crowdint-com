class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_rank

  def user_rank
    object.received_bonuses.size
  end

end
