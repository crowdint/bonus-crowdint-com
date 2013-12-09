class BonusBatch.Views.Organizations.NewView extends BonusBatch.Views.New
  templatePath: 'organizations/form'

  tagName: 'section'

  id: 'new-organization'

  handleSuccess: (response) =>
    BonusBatch.Router.navigate '/my-organizations', trigger: true
