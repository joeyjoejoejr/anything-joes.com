ProgressMapRoute = Ember.Route.extend
  model: ->
    @modelFor 'application'

  actions:
    toggleView: ->
      @get("controller").toggleProperty "showLocal"
      return

    markerClicked: (joetrack) ->
      @transitionTo "update", joetrack

`export default ProgressMapRoute`
