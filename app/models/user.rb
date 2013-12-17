class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_many :organizations, through: :user_organizations
  has_many :user_organizations

  has_many :batches, through: :user_batches
  has_many :user_batches

  has_many :bonuses
  has_many :received_bonuses, class_name: 'Bonus', foreign_key: :receiver_id
  has_many :given_bonuses, class_name: 'Bonus', foreign_key: :user_id

  accepts_nested_attributes_for :user_organizations

end
