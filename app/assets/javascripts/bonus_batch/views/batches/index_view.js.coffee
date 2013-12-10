class BonusBatch.Views.Batches.IndexView extends BonusBatch.Views.IndexView
  initialize: (@options) ->
    @resourceView = BonusBatch.Views.Batches.BatchView
    @model = new Backbone.Model organization_id: @options.organizationId
    super

  templatePath: 'batches/index'
