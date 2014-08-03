class Award < ActiveRecord::Base
  belongs_to :user
  belongs_to :receiver, class_name: "User"
  belongs_to :event

  delegate :name, to: :receiver, prefix: true

  validates :user, presence: true
  validates_with AwardValidator
end
