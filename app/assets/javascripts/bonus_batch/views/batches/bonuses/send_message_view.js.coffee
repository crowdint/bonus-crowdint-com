class BonusBatch.Views.Batches.Bonuses.SendMessageView extends BonusBatch.Views.ModalView
  title: 'Send Message'

  body: ->
    JST['bonus_batch/templates/batches/bonuses/_send_message'] @model.toJSON()

  action: 'Send'

  events: ->
    'keyup .message-text'  :   'validateMessage'
    'click .submit'        : 'sendMessage'

  sendMessage: ->
    @model.set
      message: @$('.message-text').val()
      sender_id: BonusBatch.CurrentUserData.id
    @destroy()

  validateMessage: ->
    #TODO: validate also once a message exists
    if $('.message-text').val().length >= 14
      $('.submit').removeAttr('disabled')
    else
      $('.submit').attr('disabled', 'disabled')


