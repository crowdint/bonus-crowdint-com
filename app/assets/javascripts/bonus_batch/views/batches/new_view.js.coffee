class BonusBatch.Views.Batches.NewView extends BonusBatch.Views.New
  initialize: ->
    @organization_id = @model.get('organization_id')
    @render()

  templatePath: 'batches/new'

  tagName: 'section'

  id: 'new-batch'

  afterRender: ->
    membersCollection = new BonusBatch.Collections.MembersCollection()
    userBatchesIndexView = new BonusBatch.Views.Batches.Users.IndexView
      collection: membersCollection
      el: @$('.batch-members')

    membersCollection.fetch
      reset: true
      data: { organization_id: @organization_id }

  handleSuccess: =>
    BonusBatch.Router.navigate "/my-organizations/#{@organization_id}", trigger: true
