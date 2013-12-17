class BonusBatch.Views.LoadingView extends BonusBatch.Views.Base
  templatePath: 'loading'

  className: 'loading'

  render: ->
    @$el.html @template _.extend(@options, @helpers)
    @
