class BonusBatch.Views.Members.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Members.MemberView
    super

  templatePath: 'members/index'

