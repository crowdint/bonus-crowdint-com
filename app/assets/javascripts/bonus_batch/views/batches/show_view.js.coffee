class BonusBatch.Views.Batches.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.on 'change', @render, @

  templatePath: 'batches/show'

  tagName: 'section'

  events:
    'click input[type="submit"]' : 'handleFormSubmit'

  afterRender: ->
    @bonusesCollection = new BonusBatch.Collections.BatchBonusesCollection
      batch_id: @model.get('id')
    bonusBatchesIndexView = new BonusBatch.Views.Batches.Bonuses.IndexView
      collection: @bonusesCollection
      el: @$('.batch-members')
    @bonusesCollection.fetch reset:true

  handleSuccess: ->
    console.log 'success'
