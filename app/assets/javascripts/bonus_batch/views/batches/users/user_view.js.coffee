class BonusBatch.Views.Batches.Users.UserView extends BonusBatch.Views.Base
  templatePath: 'batches/users/user'

  tagName: 'tr'

  events:
    'click .send-message'  :  'showMessageModal'

  showMessageModal: ->
    sendMessageView = new BonusBatch.Views.SendMessageView
      model: @model
    sendMessageView.render().show()
    $('.submit').attr('disabled', 'disabled')


