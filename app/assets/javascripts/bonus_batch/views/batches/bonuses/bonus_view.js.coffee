class BonusBatch.Views.Batches.Bonuses.BonusView extends BonusBatch.Views.Base
  initialize: ->
    @model.on 'change:message', @updateMessageInput, @

  templatePath: 'batches/bonuses/bonus'

  tagName: 'tr'

  events:
    'click .send-message'   : 'showMessageModal'
    'focusout .amount'         : 'updateAmount'

  showMessageModal: ->
    sendMessageView = new BonusBatch.Views.Batches.Bonuses.SendMessageView
      model: @model
    sendMessageView.render().show()
    $('.submit').attr('disabled', 'disabled')

  updateAmount: (event) ->
    amount = $(event.target).val()
    @model.set 'amount', amount
    $(event.target).attr 'value', amount

  updateMessageInput: (model) ->
    @$('.message').val model.get 'message'

  helpers:
    batchUserId: ->
      "#{@batch_id}#{@receiver_id}"
