class BonusBatch.Views.DashboardView extends BonusBatch.Views.Base
  templatePath: 'dashboard'

  tagName: 'section'

  id: 'dashboard'

  render: ->
    @$el.html @template()
    @renderOrganizations()
    @

  renderOrganizations: ->
    organizationsCollection = new BonusBatch.Collections.OrganizationsCollection
    organizationsView = new BonusBatch.Views.Organizations.IndexView
      el: @$('#organizations')
      collection: organizationsCollection
    organizationsCollection.fetch reset: true
