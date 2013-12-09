class UserBatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch

  delegate :name, to: :user, prefix: true
end
