class BonusBatch.Views.Base extends Backbone.View
  template: (params = {}) ->
    JST["bonus_batch/templates/#{@templatePath}"] params

  model: new Backbone.Model

  render: ->
    @$el.html @template @model.toJSON()
    @
