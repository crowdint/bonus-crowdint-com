class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_rank, :user_organization

  def user_rank
    object.received_bonuses.size
  end

  def user_organization
    object.user_organizations.where(organization_id: @options[:organization_id]).first
  end
end
