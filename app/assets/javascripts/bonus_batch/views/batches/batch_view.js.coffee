class BonusBatch.Views.Batches.BatchView extends BonusBatch.Views.Base
  templatePath: 'batches/batch'

  tagName: 'tr'

  events:
    'click .remove' : 'removeBatch'

  removeBatch: ->
    data = { _method: 'delete', organization_id: @model.get('organization').id }
    $.post("/batches/#{@model.id}", data)
    @remove()
    return false
