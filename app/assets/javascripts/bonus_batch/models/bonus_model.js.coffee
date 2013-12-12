class BonusBatch.Models.BonusModel extends Backbone.Model
  initialize: ->
    @set 'user_id', BonusBatch.CurrentUserData.id

  urlRoot: '/bonuses'

  url: ->
    segments = ['/bonuses/']
    segments.push @id if @id
    segments.join('')
