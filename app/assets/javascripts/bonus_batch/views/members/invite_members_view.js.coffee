class BonusBatch.Views.InviteMembersView extends BonusBatch.Views.ModalView
  initialize: (@options) ->

  title: 'Invite Members'

  body: ->
    JST['bonus_batch/templates/members/_invite_body']()

  action: 'Invite'

  cancel: 'Cancel'

  events: ->
    'click .submit'       : 'sendInvite'
    'click .cancel-form'  : 'destroy'

  sendInvite: ->
    emails = @removeExtraComma(@$('#mail-recipient'))
    to      = emails
    @send(new BonusBatch.Models.Email, to)

  send: (model, to) ->
    model.save { to: to, organization_id: @options.organization_id },
      success: (model, response, options) =>
        #TODO: show success message
        @$el.modal('hide')
      error: (model, error, options) =>
        #TODO: show validation errors
      complete: =>
        @destroy()

  removeExtraComma: (recipient) ->
    emails = recipient.val()
    check = emails.charAt(emails.length-1)
    emails = emails.slice(0, emails.length-1) if check == ","
    emails


