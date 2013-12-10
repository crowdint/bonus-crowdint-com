class BonusBatch.Views.Organizations.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.fetch()
    @model.on 'change', @renderSettings, @

  templatePath: 'organizations/show'

  events:
    'click .nav li' : 'selectTab'

  beforeRender: ->
    @el.id = @model.get 'id'

  afterRender: ->
    @displayTab @options.tab
    @renderBatches()
    @renderMembers()

  tagName: 'section'

  selectTab: (event) ->
    tab = $(event.target).attr('href')
    BonusBatch.Router.navigate tab, trigger: false

  displayTab: (tab) ->
    @$("[data-target='##{tab}']").tab('show')
    @$("##{tab}").toggleClass('active')

  renderBatches: ->
    batches = new BonusBatch.Collections.BatchesCollection()
    batchesIndexView = new BonusBatch.Views.Batches.IndexView
      el: @$('#batches')
      collection: batches
      organizationId: @model.id
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
