class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :team

  has_many :awards

  validates :opens_at, presence: true

  delegate :name, to: :team, prefix: true
end
