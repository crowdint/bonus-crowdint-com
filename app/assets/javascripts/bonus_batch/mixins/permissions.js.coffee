BonusBatch.Mixins.Permissions =
  #user roles sorted from highest to lowest
  userRoles: ['owner', 'admin', 'member']

  updateCurrentUserData: (attributes) ->
    _.extend BonusBatch.CurrentUserData, attributes
    @checkPermissions()

  #This way we are forced to add an if isAdmin validation for every needed element
  permissionHelpers:
    adminRoles: ['admin', 'owner']

    isAdmin: ->
      BonusBatch.CurrentUserData.role in @adminRoles

    canDelete: (role) ->
      role in @adminRoles
    #Example of how can we extend functionallity, maybe, if the user have a
    #permissions array we could check it
    #canManageMembers: ->
      #permissions = _.intersection BonusBatch.CurrentUserData.perrmissions, ['canPromoteMember', 'canDeleteMember']
      #!_.isEmpty permissions



  #This way, we just need to add a data attribute level with one of the following:
  #- owner
  #- admin
  #- member (if something is specific to members but not admin/owners)

  checkPermissions: ->
    [authorizables, unauthorized] = @retrieveElements()
    unauthorized.remove()
    authorizables.removeAttr('data-level')

  retrieveElements: ->
    authorizableElements = @$("[data-level]")
    unauthorizedElements = authorizableElements.not(@getPermissions())
    [authorizableElements, unauthorizedElements]

  getPermissions: ->
    authorizedLevels = @getAuthorizationLevel()
    if 'owner' in authorizedLevels
      '[data-level]'
    else
      levels = []
      levels.push("[data-level='#{level}']") for level in authorizedLevels
      levels.toString()

  getAuthorizationLevel: ->
    roleLevel = _.indexOf(@userRoles, BonusBatch.CurrentUserData.role)
    _.rest(@userRoles, roleLevel)
