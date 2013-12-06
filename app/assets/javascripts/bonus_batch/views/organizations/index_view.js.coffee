class BonusBatch.Views.Organizations.IndexView extends BonusBatch.Views.Base
  initialize: ->
    @render()
    @collection.on 'reset', @addAll, @

  templatePath: 'organizations/index'

  addAll: (organizations) ->
    organizations.each @addOne, @

  addOne: (organization) ->
    organizationView = new BonusBatch.Views.Organizations.OrganizationView
      model: organization

    @$('tbody').prepend organizationView.render().el
