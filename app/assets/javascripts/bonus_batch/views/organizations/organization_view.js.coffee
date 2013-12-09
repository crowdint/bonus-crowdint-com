class BonusBatch.Views.Organizations.OrganizationView extends BonusBatch.Views.Base
  templatePath: 'organizations/organization'

  tagName: 'tr'

  events:
    'click button' : 'removeOrganization'

  removeOrganization: ->
    @model.destroy()
    @remove()
    return false
