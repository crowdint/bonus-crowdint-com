include = (mixins...) ->
  throw('include(mixins...) requires at least one mixin') unless mixins and mixins.length > 0
  for mixin in mixins
    for own key, value of mixin
      @::[key] = value
    included = mixin.included
    included.apply(@) if included
  @

Backbone.Model.include = Backbone.Collection.include = Backbone.View.include = Backbone.Router.include = include
