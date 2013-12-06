class BonusBatch.Routers.AppRouter extends Backbone.Router
  routes:
    'my-organizations/:id'  : 'organizationsShow'
    'my-organizations'      : 'dashboard'
    'dashboard'             : 'dashboard'

  dashboard: ->
    dashBoardView = new BonusBatch.Views.DashboardView()
    $('#main-container').html dashBoardView.render().el

  organizationsShow: (id) ->
    organization = new BonusBatch.Models.Organization id: id
    organziationShowView = new BonusBatch.Views.Organizations.ShowView
      model: organization
    $('#main-container').html organizationShowView.render().el