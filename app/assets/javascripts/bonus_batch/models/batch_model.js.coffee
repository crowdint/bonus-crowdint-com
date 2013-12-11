class BonusBatch.Models.BatchModel extends Backbone.Model
  url: ->
    "/batches/#{@id}?organization_id=#{@get('organization_id')}"
