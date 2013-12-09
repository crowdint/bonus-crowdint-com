class Batch < ActiveRecord::Base
  after_initialize :default_allocation

  has_many :users, through: :user_batches
  has_many :user_batches
  has_many :bonuses
  belongs_to :organization

  accepts_nested_attributes_for :user_batches

  private
  def default_allocation
    self.allocation ||= self.organization.total_allocation
  end

end
