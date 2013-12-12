class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_many :organizations, through: :user_organizations
  has_many :user_organizations

  has_many :batches, through: :user_batches
  has_many :user_batches

  has_many :bonuses

  accepts_nested_attributes_for :user_organizations

  def received_bonuses
    Bonus.for_user self
  end
end
