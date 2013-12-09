class BonusBatch.Views.Organizations.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.fetch()
    @model.on 'change', @renderSettings, @

  templatePath: 'organizations/show'

  beforeRender: ->
    @el.id = @model.get 'id'

  afterRender: ->
    @$("##{@options.tab}").show()
    @renderBatches()

  tagName: 'section'

  renderBatches: ->
    batches = new BonusBatch.Collections.BatchesCollection()
    batchesIndexView = new BonusBatch.Views.Batches.IndexView
      el: @$('#batches')
      collection: batches
    batches.fetch reset: true, data: { organization_id: @model.id }

  renderMembers: ->

  renderSettings: ->
    editView = new BonusBatch.Views.Organizations.EditView
      el: @$('#settings')
      model: @model
    editView.render()
