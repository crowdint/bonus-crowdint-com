class BonusBatch.Views.New extends BonusBatch.Views.Base
  initialize: ->
    #@model.on 'validated', @handleValidation
    #@model.on 'error', @handleError

  events:
    'click input[type="submit"]'  : 'handleFormSubmit'
    'click .cancel'               : 'cancelForm'

  cancelForm: (event) ->
    event.preventDefault()
    @remove()

  handleSuccess: (response) =>
    @collection.add @model
    @afterValidate() if @afterValidate


