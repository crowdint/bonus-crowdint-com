class Award < ActiveRecord::Base
  belongs_to :user
  belongs_to :receiver, class_name: "User"

  delegate :name, to: :receiver, prefix: true
end
