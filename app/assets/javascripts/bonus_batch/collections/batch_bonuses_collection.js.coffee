class BonusBatch.Collections.BatchBonusesCollection extends Backbone.Collection
  initialize: (options) ->
    @batch_id = options.batch_id

  url: ->
    "/batches/#{@batch_id}/bonuses"
