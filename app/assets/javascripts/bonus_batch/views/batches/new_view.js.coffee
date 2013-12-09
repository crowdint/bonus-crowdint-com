class BonusBatch.Views.Batches.NewView extends BonusBatch.Views.New
  initialize: ->
    @organization_id = @model.get('organization_id')
    @render()

  templatePath: 'batches/form'

  tagName: 'section'

  id: 'new-batch'

  afterRender: ->
    userBatchesCollection = new BonusBatch.Collections.MembersCollection()
    userBatchesIndexView = new BonusBatch.Views.Batches.Users.IndexView
      collection: userBatchesCollection
      el: @$('#batch-members')
    userBatchesCollection.fetch
      reset: true
      data: { organization_id: @organization_id }

  handleSuccess: =>
    BonusBatch.Router.navigate "/my-organizations/#{@organization_id}", trigger: true
