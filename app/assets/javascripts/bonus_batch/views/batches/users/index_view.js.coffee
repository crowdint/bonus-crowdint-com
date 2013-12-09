class BonusBatch.Views.Batches.Users.IndexView extends BonusBatch.Views.IndexView
  initialize: ->
    @resourceView = BonusBatch.Views.Batches.Users.UserView
    super

  templatePath: 'batches/users/index'
