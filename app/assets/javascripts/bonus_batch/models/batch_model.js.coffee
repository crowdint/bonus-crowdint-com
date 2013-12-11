class BonusBatch.Models.BatchModel extends Backbone.Model
  url: ->
    segments = ['/batches/', "?organization_id=#{@get('organization_id')}"]
    segments.splice(1,0, @id) if @id
    segments.join('')
