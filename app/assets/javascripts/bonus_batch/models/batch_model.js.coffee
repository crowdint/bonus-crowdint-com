class BonusBatch.Models.BatchModel extends Backbone.Model
  initialize: ->
    @on 'change:id', @setUserBatchId, @

  url: ->
    segments = ['/batches/', "?organization_id=#{@get('organization_id')}"]
    segments.splice(1,0, @id) if @id
    segments.join('')

  setUserBatchId: ->
    myBatch =_.findWhere @get('user_batches'), user_id: BonusBatch.CurrentUserData.id
    @set 'user_batch_id', myBatch.id
