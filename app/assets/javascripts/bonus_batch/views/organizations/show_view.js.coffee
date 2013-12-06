class BonusBatch.Views.Organizations.ShowView extends BonusBatch.Views.Base
  initialize: (@options) ->
    @model.fetch()
    @model.on 'change', @renderSettings, @

  templatePath: 'organizations/show'

  beforeRender: ->
    @el.id = @model.get 'id'

  afterRender: ->
    @$("##{@options.tab}").show()

  tagName: 'section'

  renderBatches: ->

  renderMembers: ->

  renderSettings: ->
    settingsView = new BonusBatch.Views.Organizations.SettingsView
      el: @$('#settings')
      model: @model
    settingsView.render()
