class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :omniauthable

  has_many :organizations, -> { select('organizations.*, user_organizations.role AS user_role') }, through: :user_organizations
  has_many :user_organizations, dependent: :destroy

  has_many :batches, -> { select('batches.*, user_batches.balance AS batch_balance') }, through: :user_batches
  has_many :user_batches, dependent: :destroy

  has_many :given_bonuses, class_name: 'Bonus', foreign_key: :sender_id
  has_many :received_bonuses, class_name: 'Bonus', foreign_key: :receiver_id
end
