class BonusBatch.Views.Batches.BatchView extends BonusBatch.Views.Base
  templatePath: 'batches/batch'

  tagName: 'tr'

  events:
    'click .remove' : 'removeBatch'
    'click .lock'   : 'toggleLock'

  removeBatch: ->
    data = { _method: 'delete', organization_id: @model.get('organization').id }
    $.post("/batches/#{@model.id}", data)
    @remove()
    return false

  toggleLock: ->
    if @model.get('status') is 1 then status = 0 else status = 1
    data = { _method: 'put', organization_id: @model.get('organization').id, status: status }
    $.post("/batches/#{@model.id}", data)
    @updateLock(status)
    return false

  afterRender: ->
    @updateLock(@model.get('status'))

  updateLock: (status)->
    if status is 1
      console.log status
      @$('.lock').text('Unlock')
      @$('.status').text('Closed')
    else
      console.log status
      @$('.lock').text('Lock')
      @$('.status').text('Open')

