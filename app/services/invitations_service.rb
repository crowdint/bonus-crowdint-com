class InvitationsService
  def initialize controller
    @controller = controller
  end

  def assign user, organization_id
    user.user_organizations.where(
      organization_id: organization_id,
      role: 'member').first_or_create
  end
end
