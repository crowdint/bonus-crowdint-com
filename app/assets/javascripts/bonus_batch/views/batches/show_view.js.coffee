class BonusBatch.Views.Batches.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.on 'change', @render, @

  templatePath: 'batches/show'

  tagName: 'section'

  afterRender: ->
    bonusesCollection = new BonusBatch.Collections.BonusesCollection()
    bonusesCollection.remove bonusesCollection.get(BonusBatch.CurrentUserData.id)
    bonusBatchesIndexView = new BonusBatch.Views.Batches.Bonuses.IndexView
      collection: bonusesCollection
      el: @$('.batch-members')
      #bonusesCollection.fetch reset:true, data: { batch_id: @model.id }
    window.mod = @model
    window.col = bonusesCollection
    bonusesCollection.reset @model.get('user_batches')

