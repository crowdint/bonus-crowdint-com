class BonusBatch.Views.Batches.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.on 'change', @render, @

  templatePath: 'batches/show'

  beforeRender: ->
    @el.id = @model.get 'id'

  tagName: 'section'

  afterRender: ->
    userBatchesIndexView = new BonusBatch.Views.Batches.Users.IndexView
      el: @$('.batch-members')
    userBatchesCollection.reset @model.get('user_batches')
