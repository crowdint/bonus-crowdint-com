class BonusBatch.Collections.BatchBonusesCollection extends Backbone.Collection
  initialize: (options) ->
    @current_balance = parseInt options.current_balance
    @batch_id = options.batch_id
    @on 'reset', @calculateTotal, @
    @on 'change:amount', @updateTotal, @

  url: ->
    "/batches/#{@batch_id}/bonuses"

  model: BonusBatch.Models.BonusModel

  total: 0

  parse: (response) ->
    _.without response, @mySelf response

  mySelf: (models)->
    _.findWhere models, receiver_id: BonusBatch.CurrentUserData.id

  saveAll: ->
    model.save() for model in @models

  calculateTotal: =>
    @total = @reduce ((total, model) ->
                        total + parseInt(model.get('amount'))
                      ), 0

  remaining: =>
    @current_balance - @total

  updateTotal: =>
    @calculateTotal()
