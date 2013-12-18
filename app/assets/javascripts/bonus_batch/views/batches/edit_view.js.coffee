class BonusBatch.Views.Batches.EditView extends BonusBatch.Views.Base
  initialize: ->
    @model.on 'change', @render, @

  templatePath: 'batches/edit'

  tagName: 'section'

  events:
    'click input[type="submit"]' : 'handleFormSubmit'

  afterRender: ->
    @bonusesCollection = new BonusBatch.Collections.BatchBonusesCollection
      batch_id: @model.get('id')
      current_balance: @model.get('user_balance')
    bonusBatchesIndexView = new BonusBatch.Views.Batches.Bonuses.IndexView
      collection: @bonusesCollection
      el: @$('.batch-members')
    @bonusesCollection.fetch reset:true, data: { for_current_user: true }
    #TODO refactor thhis binding
    @bonusesCollection.on 'change reset', @toggleSubmit, @

  toggleSubmit: (collection) ->
    enabled = @bonusesCollection.remaining() >= 0
    $('input[type="submit"]').attr 'disabled', !enabled

  handleSuccess: ->
    console.log 'success'

  helpers:
    remainingBalance: ->
      @user_balance - @current_balance
