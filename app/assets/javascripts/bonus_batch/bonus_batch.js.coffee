#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BonusBatch =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  dashboard: ->
    @Router = new BonusBatch.Routers.AppRouter()
    Backbone.history.start pushState: true
