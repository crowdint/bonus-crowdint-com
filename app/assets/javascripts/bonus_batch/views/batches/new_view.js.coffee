class BonusBatch.Views.Batches.NewView extends BonusBatch.Views.New
  initialize: ->
    @model.save({}
      success: (model) =>
        @render()
    )

  templatePath: 'batches/form'

  tagName: 'section'

  id: 'new-batch'

  afterRender: ->
    userBatchesCollection = new BonusBatch.Collections.UserBatchesCollection()
    userBatchesIndexView = new BonusBatch.Views.Batches.Users.IndexView
      collection: userBatchesCollection
      el: @$('#batch-members')
    userBatchesCollection.reset @model.get('user_batches')
