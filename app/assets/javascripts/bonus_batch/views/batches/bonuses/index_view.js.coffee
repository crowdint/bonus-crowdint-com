class BonusBatch.Views.Batches.Bonuses.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Batches.Bonuses.BonusView
    super

  templatePath: 'batches/bonuses/index'

