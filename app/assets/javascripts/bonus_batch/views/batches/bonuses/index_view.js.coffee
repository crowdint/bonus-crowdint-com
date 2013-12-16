class BonusBatch.Views.Batches.Bonuses.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @collection.on 'change reset', @updateQuantity, @
    @resourceView = BonusBatch.Views.Batches.Bonuses.BonusView
    super

  templatePath: 'batches/bonuses/index'

  updateQuantity: ->
    @$('#total-bonus').html @collection.total
