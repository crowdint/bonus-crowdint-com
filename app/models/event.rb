class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"

  validates :opens_at, presence: true
end
