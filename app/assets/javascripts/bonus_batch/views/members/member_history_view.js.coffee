class BonusBatch.Views.Members.MemberHistoryView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.on 'change', @render, @

  templatePath: 'members/history'

  tagName: 'div'

  className: 'user-history active well'
