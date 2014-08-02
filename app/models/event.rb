class Event < ActiveRecord::Base
  validates :opens_at, presence: true
end
