class BonusBatch.Views.Members.MemberView extends BonusBatch.Views.Base
  templatePath: 'members/member'

  tagName: 'tr'

  events:
    'click .remove' : 'removeMember'

  removeMember: ->
    organization_id = @model.get('user_organization').organization_id
    data = { _method: 'delete', organization_id: organization_id }
    $.post("/users/#{@model.id}", data)
    @remove()
    return false
