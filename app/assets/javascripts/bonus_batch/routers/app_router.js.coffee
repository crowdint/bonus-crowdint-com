class BonusBatch.Routers.AppRouter extends Backbone.Router
  routes:
    'my-organizations/new'                                  : 'newOrganization'
    'my-organizations/:organization_id/members/:id'          : 'membersShow'
    'my-organizations/:organization_id/batches/new'         : 'newBatch'
    'my-organizations/:organization_id/batches/:id'         : 'batchesShow'
    'my-organizations/:id(/:tab)'                           : 'organizationsShow'
    'my-organizations(/)'                                   : 'dashboard'
    'dashboard'                                             : 'dashboard'

  dashboard: ->
    dashBoardView = new BonusBatch.Views.DashboardView()
    $('#main-container').html dashBoardView.render().el

  newOrganization: ->
    newOrganizationView = new BonusBatch.Views.Organizations.NewView()
    $('#main-container').html newOrganizationView.render().el

  organizationsShow: (id, tab = 'batches') ->
    organization = new BonusBatch.Models.OrganizationModel id: id
    organziationShowView = new BonusBatch.Views.Organizations.ShowView
      model: organization
      tab: tab
    $('#main-container').html organziationShowView.render().el

  newBatch: (organization_id) ->
    batch = new BonusBatch.Models.BatchModel organization_id: organization_id
    newBatchView = new BonusBatch.Views.Batches.NewView
      model: batch
      el: $('#main-container')

  batchesShow: (organization_id, batch_id) ->
    batch = new BonusBatch.Models.BatchModel organization_id: organization_id, id: batch_id
    batchShowView = new BonusBatch.Views.Batches.ShowView
      model: batch
      el: $('#main-container')
    batch.fetch()

  membersShow: (organization_id, member_id) ->
    member = new BonusBatch.Models.MemberModel
      organization_id: organization_id
      id: member_id
    memberHistoryView = new BonusBatch.Views.Members.MemberHistoryView
      model: member
      el: $('#main-container')
    member.fetch data: { organization_id: organization_id }


