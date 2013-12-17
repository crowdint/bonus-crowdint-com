class Bonus < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user

  belongs_to :receptor, class_name: 'User', foreign_key: :receiver_id
  delegate :name, to: :receptor, prefix: true, allow_nil: true
  delegate :name, to: :user, prefix: true, allow_nil: true

  scope :by_batch, ->(batch_id) { where batch_id: batch_id }
  scope :for_user, ->(user_id) { where receiver_id: user_id }
end
