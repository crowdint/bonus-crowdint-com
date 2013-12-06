class BonusBatch.Routers.AppRouter extends Backbone.Router
  routes:
    'my-organizations/new'          : 'newOrganization'
    'my-organizations/:id(/:tab)'   : 'organizationsShow'
    'my-organizations'              : 'dashboard'
    'dashboard'                     : 'dashboard'

  dashboard: ->
    dashBoardView = new BonusBatch.Views.DashboardView()
    $('#main-container').html dashBoardView.render().el

  newOrganization: ->
    newOrganizationModel =  new BonusBatch.Models.OrganizationModel()
    newOrganizationView = new BonusBatch.Views.Organizations.NewView
      model: newOrganizationModel
    $('#main-container').html newOrganizationView.render().el

  organizationsShow: (id, tab = 'batches') ->
    organization = new BonusBatch.Models.OrganizationModel id: id
    organziationShowView = new BonusBatch.Views.Organizations.ShowView
      model: organization
      tab: tab
    $('#main-container').html organziationShowView.render().el
