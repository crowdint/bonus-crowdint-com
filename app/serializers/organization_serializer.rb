class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_role, :total_allocation, :min_bonus,
    :max_bonus, :min_assignments

  def user_role
    object.user_organizations.where(user: scope).first.role
  end
end
