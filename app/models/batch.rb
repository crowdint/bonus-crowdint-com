class Batch < ActiveRecord::Base
  after_initialize :default_allocation
  before_save :set_users

  has_many :users, through: :user_batches
  has_many :user_batches
  has_many :bonuses
  belongs_to :organization

  private
  def default_allocation
    self.allocation ||= self.organization.total_allocation
  end

  def set_users
    self.users = self.organization.users
  end
end
