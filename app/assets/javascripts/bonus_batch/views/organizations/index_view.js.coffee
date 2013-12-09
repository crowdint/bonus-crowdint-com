class BonusBatch.Views.Organizations.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Organizations.OrganizationView
    super

  templatePath: 'organizations/index'


