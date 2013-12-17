class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_rank, :user_organization, :total_received_amount, :total_given_amount
  has_many :received_bonuses
  has_many :given_bonuses

  def user_rank
    object.received_bonuses.size
  end

  def user_organization
    object.user_organizations.where(organization_id: @options[:organization_id]).first
  end

  def total_received_amount
    object.received_bonuses.sum('amount')
  end

  def total_given_amount
    object.given_bonuses.sum('amount')
  end


end
