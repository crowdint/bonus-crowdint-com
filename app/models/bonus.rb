class Bonus < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
end
