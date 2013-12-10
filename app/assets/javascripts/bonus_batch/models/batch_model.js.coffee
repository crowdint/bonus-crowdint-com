class BonusBatch.Models.BatchModel extends Backbone.Model
  url: '/batches'

  #temporally patch for batch call
  parse: (response) ->
    response[0] || response

