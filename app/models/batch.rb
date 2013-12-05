class Batch < ActiveRecord::Base
  has_many :users, through: :user_batches
  has_many :user_batches
  has_many :bonuses
  belongs_to :organization
end
