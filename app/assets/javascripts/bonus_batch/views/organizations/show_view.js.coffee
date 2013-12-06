class BonusBatch.Views.Organizations.ShowView extends BonusBatch.Views.Base
  templatePath: 'organizations/show'

  tagName: 'section'

  id: ->
    @model.get('id')
