class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :awards

  validates :opens_at, presence: true
end
