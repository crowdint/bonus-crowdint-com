#= require_self
#= require_tree ./templates
#= require_tree ./mixins
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.BonusBatch =
  Models: {}
  Collections: {}
  Routers: {}
  Router: null
  Mixins: {}
  Views:
    Organizations: {}
    Batches:
      Users: {}
    Members: {}
  CurrentUserData: null

  dashboard: ->
    @Router = new BonusBatch.Routers.AppRouter()
    Backbone.history.start pushState: true

$.fn.serializeObject = ->
  @.formParams()
