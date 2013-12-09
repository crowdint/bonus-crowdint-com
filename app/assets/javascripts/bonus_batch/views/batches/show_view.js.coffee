class BonusBatch.Views.Batches.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.on 'change', @render, @

  templatePath: 'batches/show'

  beforeRender: ->
    @el.id = @model.get 'id'

  tagName: 'section'
