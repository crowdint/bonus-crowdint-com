class BonusBatch.Routers.AppRouter extends Backbone.Router
  routes:
    'dashboard' : 'dashboard'

  dashboard: ->
    dashBoardView = new BonusBatch.Views.DashboardView()
    $('#main-container').html dashBoardView.render().el
