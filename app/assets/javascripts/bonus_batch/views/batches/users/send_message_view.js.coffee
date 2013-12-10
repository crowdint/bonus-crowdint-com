class BonusBatch.Views.SendMessageView extends BonusBatch.Views.ModalView

  title: 'Send Message'

  body: JST['bonus_batch/templates/batches/users/_send_message']()

  action: 'Send'

  events: ->
    'keyup .message-text'  :   'validateMessage'
    'click .submit'        : 'sendMessage'

  sendMessage: ->
    #bonusModel = new BonusBatch.Models.BonusModel
    #bonusModel.save { receiver_id: , sender_id:,  }

  validateMessage: (event)->
    if $(event.target).val().length >= 14
      $('.submit').removeAttr('disabled')

