class BonusBatch.Views.Base extends Backbone.View
  @include BonusBatch.Mixins.Permissions

  template: (params = {}) ->
    JST["bonus_batch/templates/#{@templatePath}"] _.extend(params, @permissionHelpers, @helpers)

  model: new Backbone.Model

  render: ->
    @beforeRender()  if typeof (@beforeRender) is 'function'
    @$el.html @template @model.toJSON()
    @afterRender()  if typeof (@afterRender) is 'function'
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
