class BonusBatch.Views.Batches.IndexView extends BonusBatch.Views.Base
  initialize: ->
    @render()
    @collection.on 'reset', @addAll, @

  templatePath: 'batches/index'

  addAll: (batches) ->
    batches.each @addOne, @

  addOne: (batches) ->
    batchesView = new BonusBatch.Views.Batches.BatchView
      model: batches

    @$('tbody').prepend batchesView.render().el
