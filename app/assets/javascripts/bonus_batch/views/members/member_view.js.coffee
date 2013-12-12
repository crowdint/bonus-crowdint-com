class BonusBatch.Views.Members.MemberView extends BonusBatch.Views.Base
  templatePath: 'members/member'

  tagName: 'tr'

  events:
    'click .remove'       : 'removeMember'
    'click .set-role'  : 'setUserRole'

  removeMember: ->
    organization_id = @model.get('user_organization').organization_id
    data = { _method: 'delete', organization_id: organization_id }
    $.post("/users/#{@model.id}", data)
    @remove()
    return false

  setUserRole: (event)->
    element = event.target
    currentRole = @model.get('user_organization').role
    user_organization_id = @model.get('user_organization').id

    if currentRole is 'member' then role = 'admin' else role = 'member'
    @model.set user_organizations_attributes: { id: user_organization_id, role: role },
      silent: true
    @model.save({}
      success: (model, response)=>
        @updateRole(element, model.get('user_organizations_attributes').role)
    )

  updateRole: (element, role) ->
    @$(element).parent().siblings('.role').text("#{role}")

