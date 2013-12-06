class BonusBatch.Views.Base extends Backbone.View
  template: (params = {}) ->
    JST["bonus_batch/templates/#{@templatePath}"] params

  model: new Backbone.Model

  render: ->
    @$el.html @template @model.toJSON()
    @

  params: ->
    @$('form').serializeObject()

  handleFormSubmit: (event) =>
    event.preventDefault()
    @model.clear silent: true
    @model.set @params(),
      silent: true
    if @model.isValid true
      @model.save({}
        success: (model, response) =>
          @handleSuccess(response)
      )
