class BonusBatch.Views.Organizations.EditView extends BonusBatch.Views.Base
  templatePath: 'organizations/edit'

  events:
    "click input[type='submit']" : 'handleFormSubmit'

  handleSuccess: ->
    console.log 'success'