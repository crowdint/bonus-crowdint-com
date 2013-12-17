BonusBatch.Mixins.Loading =
  renderLoader: (element, message = null) ->
    loadingView = new BonusBatch.Views.LoadingView message: message
    @loader = loadingView.render()
                         .$el
                         .appendTo(element)

  removeLoader: ->
    @loader.remove() if @loader
