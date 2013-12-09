class BonusBatch.Views.Batches.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Batches.BatchView
    super

  templatePath: 'batches/index'
