class BonusBatch.Views.IndexView extends BonusBatch.Views.Base
  initialize: ->
    @render()
    @collection.on 'reset', @addAll, @

  addAll: (resources) ->
    resources.each @addOne, @

  addOne: (resource) ->
    resourceView = new @resourceView
      model: resource

    @$('tbody').prepend resourceView.render().el
