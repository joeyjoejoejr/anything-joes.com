Index = Ember.Route.extend
  model: ->
    @modelFor 'application'

  actions:
    clickItem: (joetrack) ->
      @transitionTo "update", joetrack

`export default Index`
