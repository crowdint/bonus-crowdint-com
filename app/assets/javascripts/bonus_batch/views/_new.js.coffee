class BonusBatch.Views.New extends BonusBatch.Views.Base
  events:
    'click input[type="submit"]'  : 'handleFormSubmit'
    'click .cancel'               : 'cancelForm'

  cancelForm: (event) ->
    event.preventDefault()
    @remove()

