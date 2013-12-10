class BonusBatch.Models.Email extends Backbone.Model
  urlRoot: '/invitations'

  allEmailsValid: (emails) ->
    @validEmails(emails)

  isValidEmail: (email)->
    email.match(/[a-zA-Z0-9.!#$%&'*+-\/=?\^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/)?

  validate: (attributes, options) ->
    'validation error' unless @allEmailsValid(attributes.to)

  validEmails: (emails) ->
    emails = _.compact emails.split(',')
    _.all(emails, @isValidEmail) if emails.length

