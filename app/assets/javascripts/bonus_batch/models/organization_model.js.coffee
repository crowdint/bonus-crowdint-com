class BonusBatch.Models.OrganizationModel extends Backbone.Model
  urlRoot: '/organizations'

  defaults:
    id: null
    min_bonus: 1
    min_assignments: 1
    max_bonus: 100
