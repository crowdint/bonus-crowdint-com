class Organization < ActiveRecord::Base
  has_many :users, through: :user_organizations
  has_many :user_organizations
  has_many :batches
end
