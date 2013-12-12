class BonusBatch.Models.MemberModel extends Backbone.Model
  urlRoot: '/users'

  url: ->
    segments = ['/users/', "?organization_id=#{BonusBatch.CurrentUserData.organization_id}"]
    segments.splice(1,0, @id) if @id
    segments.join('')
