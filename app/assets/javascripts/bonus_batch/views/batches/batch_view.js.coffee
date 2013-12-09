class BonusBatch.Views.Batches.BatchView extends BonusBatch.Views.Base
  templatePath: 'batches/batch'

  tagName: 'tr'

  events:
    'click button' : 'removeBatch'

  removeBatch: ->
    @model.destroy()
    @remove()
    return false
