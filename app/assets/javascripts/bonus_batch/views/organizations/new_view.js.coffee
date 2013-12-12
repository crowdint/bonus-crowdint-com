class BonusBatch.Views.Organizations.NewView extends BonusBatch.Views.New
  templatePath: 'organizations/new'

  tagName: 'section'

  id: 'new-organization'

  model: new BonusBatch.Models.OrganizationModel()

  handleSuccess: (response) =>
    BonusBatch.Router.navigate '/my-organizations', trigger: true

  params: ->
    organization = @$('form').serializeObject()
    delete organization['id']
    organization
