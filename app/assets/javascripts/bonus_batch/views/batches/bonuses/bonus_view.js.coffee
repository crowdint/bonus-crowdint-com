class BonusBatch.Views.Batches.Bonuses.BonusView extends BonusBatch.Views.Base
  templatePath: 'batches/bonuses/bonus'

  tagName: 'tr'

  events:
    'click .send-message'   : 'showMessageModal'
    'keyup .amount'         : 'updateAmount'

  showMessageModal: ->
    sendMessageView = new BonusBatch.Views.Batches.Bonuses.SendMessageView
      model: @model
    sendMessageView.render().show()
    $('.submit').attr('disabled', 'disabled')

  updateAmount: (event) ->
    amount = $(event.target).val()
    @model.set 'amount', amount

