class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  delegate :name, to: :user

  validates :user_id, uniqueness: { scope: :team_id }
end
