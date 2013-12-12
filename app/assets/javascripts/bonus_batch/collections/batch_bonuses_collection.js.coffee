class BonusBatch.Collections.BatchBonusesCollection extends Backbone.Collection
  initialize: (options) ->
    @batch_id = options.batch_id

  url: ->
    "/batches/#{@batch_id}/bonuses"

  model: BonusBatch.Models.BonusModel

  parse: (response) ->
    _.without response, @mySelf response

  mySelf: (models)->
    _.findWhere models, receiver_id: BonusBatch.CurrentUserData.id

  saveAll: ->
    model.save() for model in @models
