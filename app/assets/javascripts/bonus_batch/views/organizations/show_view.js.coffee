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

  tagName: 'section'

  renderBatches: ->

  renderMembers: ->

  renderSettings: ->
    editView = new BonusBatch.Views.Organizations.EditView
      el: @$('#settings')
      model: @model
    editView.render()
