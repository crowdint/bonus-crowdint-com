class BonusBatch.Views.Batches.NewView extends BonusBatch.Views.New
  initialize: ->
    @model.save({}
      success: (model) =>
        @render()
    )

  templatePath: 'batches/form'

  tagName: 'section'

  id: 'new-batch'
