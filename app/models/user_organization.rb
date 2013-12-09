class UserOrganization < ActiveRecord::Base
  after_initialize :default_role

  belongs_to :user
  belongs_to :organization

  private
  def default_role
    self.role ||= 'owner'
  end
end
