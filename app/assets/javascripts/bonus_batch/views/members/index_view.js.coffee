class BonusBatch.Views.Members.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Members.MemberView
    super

  templatePath: 'members/index'

  events: ->
    'click .add-member'        :  'showModal'

  showModal: ->
    inviteMembersView = new BonusBatch.Views.InviteMembersView()
    inviteMembersView.render().show()
