class Organization < ActiveRecord::Base
  has_many :users, through: :user_organizations
  has_many :user_organizations
  has_many :batches

  def is_owner?(user)
    !self.user_organizations.
        where(user_id: user.id).
        where(role: "owner").empty?
  end
end
