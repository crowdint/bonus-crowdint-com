class BonusBatch.Views.Organizations.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.fetch()
    @model.on 'change', @renderSettings, @

  templatePath: 'organizations/show'

  beforeRender: ->
    @el.id = @model.get 'id'

  afterRender: ->
    @$("[data-target='##{@options.tab}']").tab('show')
    @$("##{@options.tab}").toggleClass('active')
    @renderBatches()
    @renderMembers()

  tagName: 'section'

  renderBatches: ->
    batches = new BonusBatch.Collections.BatchesCollection()
    batchesIndexView = new BonusBatch.Views.Batches.IndexView
      el: @$('#batches')
      collection: batches
    batches.fetch reset: true, data: { organization_id: @model.id }

  renderMembers: ->
    members = new BonusBatch.Collections.MembersCollection()
    membersIndexView = new BonusBatch.Views.Members.IndexView
      el: @$('#members')
      collection: members
    members.fetch reset: true, data: { organization_id: @model.id }

  renderSettings: ->
    editView = new BonusBatch.Views.Organizations.EditView
      el: @$('#settings')
      model: @model
    editView.render()
