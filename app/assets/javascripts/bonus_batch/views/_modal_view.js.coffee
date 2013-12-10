class BonusBatch.Views.ModalView extends BonusBatch.Views.Base
  templatePath: 'modal_base_template'

  title: null

  body: null

  action: null

  attributes:
    tabindex: -1
    class: 'modal'

  render: ->
    @$el.html @template
                    title: @title
                    body: @body
                    action: @action
                    cancel: @cancel
    @

  show: ->
    @$el.modal()
