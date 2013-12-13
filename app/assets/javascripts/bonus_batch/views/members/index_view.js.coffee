class BonusBatch.Views.Members.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Members.MemberView
    super

  templatePath: 'members/index'

  events: ->
    'click .add-member'        :  'showModal'

  showModal: ->
    inviteMembersView = new BonusBatch.Views.InviteMembersView
      organization_id: BonusBatch.CurrentUserData.organization_id
    inviteMembersView.render().show()
